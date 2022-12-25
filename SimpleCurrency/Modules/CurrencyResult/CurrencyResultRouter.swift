//
//  CurrencyResultRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyResultRouterProtocol: AnyObject{
   
}

class CurrencyResultRouter: CurrencyResultRouterProtocol {
    weak var viewController: CurrencyResultVC?
    
    init(viewController: CurrencyResultVC){
        self.viewController = viewController
    }
    
}
