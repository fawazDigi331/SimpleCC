//
//  HomeInterector.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject{
    
}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
    
    required init(presenter: HomePresenter){
        self.presenter = presenter
    }
}
