//
//  APIService.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol APIServiceProtocol: AnyObject {
    var allCurrenciesUrl: String { get }
    func pairConversionUrl(currencyInCode: String, currencyOutCode: String, amount: String) -> String
}

class APIService: APIServiceProtocol {
    // Base or Default currency is USD
    var allCurrenciesUrl: String {
        return "\(urls.liveBaseUrl)/latest/USD"
    }
    func pairConversionUrl(currencyInCode: String, currencyOutCode: String, amount: String) -> String {
        return "\(urls.liveBaseUrl)pair/\(currencyInCode)/\(currencyOutCode)/\(amount)"
    }
}
