//
//  CurrencyResultConfigurator.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol CurrencyResultConfiguratorProtocol: AnyObject {
    func configure(with viewController: CurrencyResultVC)
}

class CurrencyResultConfigurator: CurrencyResultConfiguratorProtocol{
    func configure(with viewController: CurrencyResultVC) {
        
        let presenter =  CurrencyResultPresenter(view: viewController)
        let interector = CurrencyResultInteractor(presenter: presenter)
        let router = CurrencyResultRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interector
        presenter.router = router
    }
}
