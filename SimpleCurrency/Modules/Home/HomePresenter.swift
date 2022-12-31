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
    func interectorDidFetchCurrencies(with result: Result<Currency, Error>)
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
    }
    
    func swapButtonTapped() {
        view?.swapCurrency()
    }
    
    func interectorDidFetchCurrencies(with result: Result<Currency, Error>) {
        switch result{
        case .success(let currencies):
            print("Currencies: \(currencies)")
            Storage.store(currencies, to: .documents, as: storageKey.pairCurrencies)
            router?.showCurrencyConvertScreen()
        case .failure(let error):
            // if you want to show the api errors / custom errors to user you can create any alertbox or create toast message to show.
            print("Something went wrong! \(error.localizedDescription)")
        }
    }
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
}
