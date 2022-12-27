//
//  CurrencyResultPresenter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyResultPresenterProtocol: AnyObject {
    var interactor: CurrencyResultInteractorProtocol! { set get }
    var router: CurrencyResultRouterProtocol! { set get }
    func configureView()
    func doneButtonTapped()
}

class CurrencyResultPresenter: CurrencyResultPresenterProtocol {
    var interactor: CurrencyResultInteractorProtocol!
    var router: CurrencyResultRouterProtocol!
    weak var view: CurrencyResultViewProtocol?
 
    func configureView() {
        view?.updateValue()
    }
    
    func doneButtonTapped() {
        // clear storage when done button tapped - This applies when we are not calculating all currencies online not locally
        interactor.clearStorage(fileName: storageKey.pairCurrencies)
        interactor.clearUserDefaults()
        router.showCurrencyHomeScreen()
    }
    required init(view: CurrencyResultViewProtocol) {
        self.view = view
    }
}
