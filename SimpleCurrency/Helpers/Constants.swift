//
//  Constants.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

// MARK: all the api related keys listed here
public struct apikeys {
    static var apiKey = "7912b8457e7c54b435870faa"
}

// MARK: all the UserDefaults keys listed here
public struct uds {
    static var kCurrencyInSymbol = "kCurrencyInSymbol"
    static var kCurrencyOutSymbol = "kCurrencyOutSymbol"
    static var kCurrencyAmountValue = "kCurrencyAmountValue"
}

// MARK: all the urls listed here - live or staging
public struct urls{
    static var liveBaseUrl = "https://v6.exchangerate-api.com/v6/\(apikeys.apiKey)/"
}

public struct segue{
    static var currencyConvertSegue = "currencyConvertSegue"
    static var currencyCalculateSegue = "currencyCalculateSegue"
    static var currencyHomeSegue = "currencyHomeSegue"
    //currencyHomeSegue
}
