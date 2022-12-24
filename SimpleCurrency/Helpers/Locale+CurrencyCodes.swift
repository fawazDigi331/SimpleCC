//
//  Locale+CurrencyCodes.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 24/12/2022.
//

import Foundation

extension Locale {
    func currancyCode(by currancyCode: String) -> String? {
        return Locale.isoCurrencyCodes.first(where: { code -> Bool in
            guard let localizedCurrencyCodes = localizedString(forRegionCode: code) else {
                return false
            }
            return localizedCurrencyCodes.lowercased() == currencyCode
        })
    }
}
