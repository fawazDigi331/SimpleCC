//
//  CurrencyConvertConfigurator.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyConvertConfiguratorProtocol: AnyObject {
    func configure(with viewController: CurrencyConvertVC)
}

class CurrencyConvertConfigurator: CurrencyConvertConfiguratorProtocol{
    func configure(with viewController: CurrencyConvertVC) {
        
        let presenter =  CurrencyConvertPresenter(view: viewController)
        let interector = CurrencyConvertInteractor(presenter: presenter)
        let router = CurrencyConvertRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interector
        presenter.router = router
    }
}
