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
        DispatchQueue.main.async {
            self.viewController?.performSegue(withIdentifier: segue.currencyConvertSegue, sender: nil)
        }
       
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare here some data for destination viewController
    }
}
