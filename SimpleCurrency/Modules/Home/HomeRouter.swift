//
//  HomeRouter.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol HomeRouterProtocol: AnyObject {
    func testNavigation()
}

class HomeRouter: HomeRouterProtocol {
    weak var viewController: HomeViewController?
    
    init(viewController: HomeViewController){
        self.viewController = viewController
    }
    
    func testNavigation() {
        print("Test Navigation")
    }
}
