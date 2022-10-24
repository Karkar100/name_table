//
//  CustomHeaderView.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import UIKit
import SnapKit

protocol HeaderProtocol: UIView {
    func hideAdd()
    
    var presenter: MainPresenterProtocol? { get set }
    
}
class CustomHeaderView: UIView, HeaderProtocol {
    var presenter: MainPresenterProtocol?
    
    let titleLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = "Дети(макс.5)"
        return lbl
    }()
    
    let addButton: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15.0
        btn.setTitle("Добавить ребёнка", for: .normal)
        btn.setTitleColor(UIColor.tintColor, for: .normal)
        btn.layer.borderColor = UIColor.tintColor.cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    init(index: Int) {
        super.init(frame: .zero)
        configureViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
            titleLabel.text = "Дети(макс.5)"
            addButton.addTarget(self, action: #selector(addCell(_:)), for: .touchUpInside)
            addSubview(titleLabel)
            addSubview(addButton)
    }
    
    func hideAdd(){
        addButton.isHidden = true
    }
    
    func setupConstraints() {
            titleLabel.snp.makeConstraints{ maker in
                maker.top.equalToSuperview().offset(10)
                maker.leading.equalToSuperview()
                maker.width.equalToSuperview().multipliedBy(0.4)
                maker.bottom.equalToSuperview().inset(10)
            }
            addButton.snp.makeConstraints{ maker in
                maker.top.equalToSuperview().offset(5)
                maker.leading.equalTo(titleLabel.snp.trailing).offset(10)
                maker.width.equalToSuperview().multipliedBy(0.5)
                maker.bottom.equalToSuperview().inset(5)
            }
    }
    
    @objc func addCell(_ sender: UIButton){
        presenter?.addCell()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
