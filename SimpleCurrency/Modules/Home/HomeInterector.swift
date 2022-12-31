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
    
   //MARK: API calls now separated from API Service - call here any api related to HomeViewController
   func callCurrencyPairAPI(){
       self.currencyInValue = UserDefaults.standard.string(forKey: uds.kCurrencyInSymbol)
       self.currencyOutValue = UserDefaults.standard.string(forKey: uds.kCurrencyOutSymbol)
       self.currencyValue = UserDefaults.standard.string(forKey: uds.kCurrencyAmountValue)
       
       let urlString = apiService.pairConversionUrl(currencyInCode: self.currencyInValue ?? "GBP", currencyOutCode: self.currencyOutValue ?? "EUR", amount: self.currencyValue ?? "1")
       guard let url = URL(string: urlString) else { return }
       print(url)
       let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
           guard let data = data, error == nil else {
               self?.presenter?.interectorDidFetchCurrencies(with: .failure(FetchError.failed))
               return
           }
           do { // success
               let decoder = JSONDecoder()
               let entities = try decoder.decode(Currency.self, from: data)
               self?.presenter?.interectorDidFetchCurrencies(with: .success(entities))
           }
           catch {
               self?.presenter?.interectorDidFetchCurrencies(with: .failure(error))
           }
           
       }
       task.resume()
   }
}
