//
//  HomePresenter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol! { set get }
    var router: HomeRouterProtocol! { set get }
    func configureView()
    func calculateButtonTapped()
    func swapButtonTapped()
   
}

class HomePresenter: HomePresenterProtocol {
    var router: HomeRouterProtocol!
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol!
    
    
    func configureView() {
        view?.configureKeyboard()
        view?.configCurrencyInPicker()
        view?.configCurrencyOutPicker()
    }
    
    func calculateButtonTapped() {
        view?.storeValues()
        interactor.callCurrencyPairAPI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.router.showCurrencyConvertScreen()
        }
        
    }
    
    func swapButtonTapped() {
        view?.swapCurrency()
    }
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
    
    
}
