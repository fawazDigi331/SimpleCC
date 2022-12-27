//
//  CurrencyResultRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyResultRouterProtocol: AnyObject{
   func showCurrencyHomeScreen()
}

class CurrencyResultRouter: CurrencyResultRouterProtocol {
    weak var viewController: CurrencyResultVC?
    
    init(viewController: CurrencyResultVC){
        self.viewController = viewController
    }
    
    func showCurrencyHomeScreen() {
        viewController?.performSegue(withIdentifier: segue.currencyHomeSegue, sender: nil)
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // prepare here some data for destination viewController
//    }
    
}
