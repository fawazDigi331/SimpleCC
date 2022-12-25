//
//  CurrencyConvertInterector.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyConvertInteractorProtocol: AnyObject{
    var router: CurrencyConvertRouterProtocol! { set get }
    var presenter: CurrencyConvertPresenterProtocol! { set get }
}

class CurrencyConvertInteractor: CurrencyConvertInteractorProtocol {
    var router: CurrencyConvertRouterProtocol!
    
    weak var presenter: CurrencyConvertPresenterProtocol!
    
    required init(presenter: CurrencyConvertPresenter){
        self.presenter = presenter
    }
}
