//
//  HomeInterector.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject{
    func callCurrencyPairAPI()
    var router: HomeRouterProtocol! { set get }
    var presenter: HomePresenterProtocol! { set get }
}

class HomeInteractor: HomeInteractorProtocol {
 
    weak var presenter: HomePresenterProtocol!
    var router: HomeRouterProtocol!
    var currencyInValue: String?
    var currencyOutValue: String?
    var currencyValue: String?
    let apiService: APIServiceProtocol = APIService()
    required init(presenter: HomePresenter){
        self.presenter = presenter
    }
    
   func callCurrencyPairAPI(){
       self.currencyInValue = UserDefaults.standard.string(forKey: uds.kCurrencyInSymbol)
       self.currencyOutValue = UserDefaults.standard.string(forKey: uds.kCurrencyOutSymbol)
       self.currencyValue = UserDefaults.standard.string(forKey: uds.kCurrencyAmountValue)

       apiService.getPairCurrencies(currencyInCode: self.currencyInValue ?? "GBP", currencyOutCode: self.currencyOutValue ?? "EUR", amount: self.currencyValue ?? "1") { (dict, err) in
           
          if err != nil {
             return
          }
           
           if let err = err{
               print(err)
           }
       }
   }
}
