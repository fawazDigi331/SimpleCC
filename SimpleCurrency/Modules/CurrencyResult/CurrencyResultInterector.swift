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
    func clearStorage(fileName: String)
    func clearUserDefaults()
}

class CurrencyResultInteractor: CurrencyResultInteractorProtocol {
    var router: CurrencyResultRouterProtocol!
    
    weak var presenter: CurrencyResultPresenterProtocol!
    
    required init(presenter: CurrencyResultPresenter){
        self.presenter = presenter
    }
    
    func clearStorage(fileName: String) {
        Storage.remove(fileName, from: .documents)
    }
    
    func clearUserDefaults() {
        // clear all the data in the userdefaults
        if let appDomain = Bundle.main.bundleIdentifier {
          UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
    
}
