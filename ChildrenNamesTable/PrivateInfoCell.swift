//
//  PrivateInfoCell.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import UIKit
import SnapKit

class PrivateInfoCell: UITableViewCell{
    static let reuseId = "reuseId"
    
    var presenter: MainPresenterProtocol?
    
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
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageTextField)
    }
    
    func setUpConstraints(){
            nameTextField.snp.makeConstraints{ maker in
                maker.top.equalToSuperview().offset(10)
                maker.leading.equalToSuperview()
                maker.trailing.equalToSuperview()
                maker.height.equalTo(50)
            }
            ageTextField.snp.makeConstraints{ maker in
                maker.top.equalTo(nameTextField.snp.bottom).offset(10)
                maker.leading.equalToSuperview()
                maker.trailing.equalToSuperview()
                maker.height.equalTo(50)
            }
    }
    
    func configure(){
        placeSubviews()
        setUpConstraints()
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
