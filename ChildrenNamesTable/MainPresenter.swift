//
//  MainPresenter.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    func reload()
    
    func clearPersonalInfo(indexPath: IndexPath)
}

protocol MainPresenterProtocol: class, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    init(view: MainViewProtocol, router: RouterProtocol)
    func addCell()
    func clearData()
}

class MainPresenter: NSObject, MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var children: [Child] = []
    var myName: String = ""
    var myAge: Int = 0
    let reuseID = "ID"
     required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func addCell() {
        var child = Child(name: "", age: 0)
        if children.count < 5{
            children.append(child)
            view?.reload()
        }
    }
    
    func removeCell(index: Int) {
        children.remove(at: index)
        view?.reload()
    }
    
    func clearData() {
        let indexPath = IndexPath(row: 0, section: 0)
        view?.clearPersonalInfo(indexPath: indexPath)
        children.removeAll()
        view?.reload()
    }
    
    
}

extension MainPresenter: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view: HeaderProtocol?
        switch section {
        case 0:
            view = PersonalHeader()
            view?.presenter = self
        case 1:
            view = CustomHeaderView(index: 1)
            if children.count == 5{
                view?.hideAdd()
            }
            view?.presenter = self
        default:
            break
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var x: Int?
        switch section {
        case 0:
            x = 1
        case 1:
            x = children.count
        default:
            break
        }
        return x ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: PrivateInfoCell.reuseId, for: indexPath) as! PrivateInfoCell
            cell.presenter = self
            cell.configure()
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OneChildTableViewCell.reuseId, for: indexPath) as! OneChildTableViewCell
            cell.presenter = self
            cell.buttonAction = { sender in
                self.removeCell(index: indexPath.row)
            }
            cell.configure()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! UITableViewCell
            return cell
        }
    }
    
}

extension MainPresenter: UITableViewDelegate{
    
}

extension MainPresenter: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1{
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            let numbers = newString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            textField.text = numbers
            return false
        } else{
            return true
        }
    }
    
}
