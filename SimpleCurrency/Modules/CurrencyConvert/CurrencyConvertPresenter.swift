//
//  CurrencyConvertPresenter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyConvertPresenterProtocol: AnyObject {
    var interactor: CurrencyConvertInteractorProtocol! { set get }
    var router: CurrencyConvertRouterProtocol! { set get }
    func configureView()
}

class CurrencyConvertPresenter: CurrencyConvertPresenterProtocol {
    var interactor: CurrencyConvertInteractorProtocol!
    var router: CurrencyConvertRouterProtocol!
    weak var view: CurrencyConvertViewProtocol?
 
    func configureView() {
        view?.updateValue()
    }
    required init(view: CurrencyConvertViewProtocol) {
        self.view = view
    }
}
