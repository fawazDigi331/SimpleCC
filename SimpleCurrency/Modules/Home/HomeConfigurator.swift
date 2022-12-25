//
//  HomeConfigurator.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomeConfiguratorProtocol: AnyObject {
    func configure(with viewController: HomeViewController)
}

class HomeConfigurator: HomeConfiguratorProtocol{
    func configure(with viewController: HomeViewController) {
        
        let presenter = HomePresenter(view: viewController)
        let interector = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interector
        presenter.router = router
    }
}
