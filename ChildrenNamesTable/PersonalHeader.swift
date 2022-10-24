//
//  PersonalHeader.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import UIKit
import SnapKit

class PersonalHeader: UIView, HeaderProtocol {
    var presenter: MainPresenterProtocol?
    
    let titleLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = "Персональные данные"
        return lbl
    }()
    
    init() {
        super.init(frame: .zero)
        configureViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews(){
        addSubview(titleLabel)
    }
    
    func setupConstraints(){
        titleLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(10)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview().inset(10)
        }
    }
    
    func hideAdd() {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
