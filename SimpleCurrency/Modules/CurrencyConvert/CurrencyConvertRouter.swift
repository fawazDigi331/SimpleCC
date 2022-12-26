//
//  CurrencyConvertRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation
import UIKit

protocol CurrencyConvertRouterProtocol: AnyObject{
  
}

class CurrencyConvertRouter: CurrencyConvertRouterProtocol {
    
    weak var viewController: CurrencyConvertVC?
    
    init(viewController: CurrencyConvertVC){
        self.viewController = viewController
    }
    
}
