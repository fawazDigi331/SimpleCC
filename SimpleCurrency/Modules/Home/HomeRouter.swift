//
//  HomeRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    func showCurrencyConvertScreen()
   
}

class HomeRouter: HomeRouterProtocol {
    weak var viewController: HomeViewController?
    
    init(viewController: HomeViewController){
        self.viewController = viewController
    }
    
    func showCurrencyConvertScreen() {
        let vc = CurrencyConvertVC()
        let navController = UINavigationController(rootViewController: vc)
        viewController?.present(navController, animated: true)
    }
}
