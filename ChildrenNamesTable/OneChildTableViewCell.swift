//
//  OneChildTableViewCell.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import UIKit
import SnapKit

class OneChildTableViewCell: UITableViewCell {
    static let reuseId = "reuseIdentifier"
    
    var presenter: MainPresenterProtocol?
    
    var buttonAction: ((_ sender: UIButton) -> Void)?
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Возраст", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        tf.borderStyle = .roundedRect
        
        return tf
    }()
    
    let deleteButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Удалить", for: .normal)
        btn.setTitleColor(UIColor.tintColor, for: .normal)
        
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func placeSubviews(){
        nameTextField.delegate = presenter
        ageTextField.delegate = presenter
        nameTextField.tag = 0
        ageTextField.tag = 1
        deleteButton.addTarget(self, action: #selector(removeCell(_:)), for: .touchUpInside)
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageTextField)
        contentView.addSubview(deleteButton)
    }
    
    func setUpConstraints(){
            nameTextField.snp.makeConstraints{ maker in
                maker.top.equalToSuperview().offset(10)
                maker.leading.equalToSuperview()
                maker.width.equalToSuperview().multipliedBy(0.5)
                maker.height.equalTo(50)
            }
            ageTextField.snp.makeConstraints{ maker in
                maker.top.equalTo(nameTextField.snp.bottom).offset(10)
                maker.leading.equalToSuperview()
                maker.width.equalToSuperview().multipliedBy(0.5)
                maker.height.equalTo(50)
            }
            deleteButton.snp.makeConstraints{ maker in
                maker.top.equalToSuperview().offset(25)
                maker.trailing.equalToSuperview().inset(25)
                maker.width.equalToSuperview().multipliedBy(0.2)
                maker.height.equalTo(15)
            }
    }
    
    func configure(){
        placeSubviews()
        setUpConstraints()
    }
    
    @objc func removeCell(_ sender: UIButton){
        self.buttonAction?(sender)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
