//
//  Currency.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 24/12/2022.
//

import Foundation

// MARK: This model is generated from https://app.quicktype.io to save time by giving the response of paircurrency api response as input (There are many modifications available according to our requirements).

struct Currency: Codable {
    let result: String
    let documentation, termsOfUse: String
    let timeLastUpdateUnix: Int
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: Int
    let timeNextUpdateUTC, baseCode, targetCode: String
    let conversionRate, conversionResult: Double

    enum CodingKeys: String, CodingKey {
        case result, documentation
        case termsOfUse
        case timeLastUpdateUnix
        case timeLastUpdateUTC
        case timeNextUpdateUnix
        case timeNextUpdateUTC
        case baseCode
        case targetCode
        case conversionRate
        case conversionResult
    }
}
