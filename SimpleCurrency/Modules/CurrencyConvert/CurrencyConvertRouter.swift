//
//  CurrencyConvertRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation
import UIKit

protocol CurrencyConvertRouterProtocol: AnyObject{
    func showCurrencyResultScreen()
}

class CurrencyConvertRouter: CurrencyConvertRouterProtocol {
    
    weak var viewController: CurrencyConvertVC?
    
    init(viewController: CurrencyConvertVC){
        self.viewController = viewController
    }
    
    func showCurrencyResultScreen() {
        viewController?.performSegue(withIdentifier: segue.currencyCalculateSegue, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare here some data for destination viewController
    }
    
}
