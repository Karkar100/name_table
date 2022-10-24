//
//  MainViewController.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, MainViewProtocol {

    var presenter: MainPresenterProtocol?
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let clearButton: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 25.0
        btn.setTitle("Очистить", for: .normal)
        btn.setTitleColor(UIColor.systemRed, for: .normal)
        btn.layer.borderColor = UIColor.systemRed.cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func configureViews(){
        tableView.register(OneChildTableViewCell.self, forCellReuseIdentifier: OneChildTableViewCell.reuseId)
        tableView.register(PrivateInfoCell.self, forCellReuseIdentifier: PrivateInfoCell.reuseId)
        tableView.dataSource = presenter
        tableView.delegate = presenter
        clearButton.addTarget(self, action: #selector(clearTable(_:)), for: .touchUpInside)
        view.addSubview(tableView)
        view.addSubview(clearButton)
    }

    func setUpConstraints(){
        tableView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().inset(10)
            maker.bottom.equalToSuperview().inset(75)
        }
        clearButton.snp.makeConstraints{ maker in
            maker.top.equalTo(tableView.snp.bottom).offset(10)
            maker.bottom.equalToSuperview().inset(15)
            maker.height.equalTo(50)
            maker.width.equalToSuperview().multipliedBy(0.5)
            maker.centerX.equalToSuperview()
        }
    }

    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    func clearPersonalInfo(indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as? PrivateInfoCell
        cell?.nameTextField.text = ""
        cell?.ageTextField.text = ""
    }
    
    @objc func clearTable(_ sender: UIButton){
        DispatchQueue.main.async {
            let optionMenu = UIAlertController(title: nil, message: "Очистить таблицу?", preferredStyle: .actionSheet)
            let clearAction = UIAlertAction(title: "Сбросить данные", style: .destructive){ [unowned self] action in
                presenter?.clearData()
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
            optionMenu.addAction(clearAction)
            optionMenu.addAction(cancelAction)
            self.present(optionMenu, animated: true)
        }
    }
}

