//
//  ModuleBuilder.swift
//  ChildrenNamesTable
//
//  Created by Diana Princess on 24.10.2022.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol {
    func buildMainScreen(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func buildMainScreen(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
