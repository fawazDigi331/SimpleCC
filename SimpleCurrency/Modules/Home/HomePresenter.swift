//
//  HomePresenter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
  //  var interactor: HomeInteractorProtocol! { set get }
  //  var router: HomeRouterProtocol! { set get }
    func configureView()
    func calculateButtonTapped()
   
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    func configureView() {
        view?.configureKeyboard()
        view?.configCurrencyInPicker()
        view?.configCurrencyOutPicker()
    }
    
    func calculateButtonTapped() {
        interactor.callCurrencyPairAPI()
    }
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
    
    
}
