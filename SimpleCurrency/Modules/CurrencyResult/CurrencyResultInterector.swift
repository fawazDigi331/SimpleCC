//
//  CurrencyResultInterector.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyResultInteractorProtocol: AnyObject{
    var router: CurrencyResultRouterProtocol! { set get }
    var presenter: CurrencyResultPresenterProtocol! { set get }
}

class CurrencyResultInteractor: CurrencyResultInteractorProtocol {
    var router: CurrencyResultRouterProtocol!
    
    weak var presenter: CurrencyResultPresenterProtocol!
    
    required init(presenter: CurrencyResultPresenter){
        self.presenter = presenter
    }
}
