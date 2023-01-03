//
//  SimpleCurrencyTests.swift
//  SimpleCurrencyTests
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import XCTest
@testable import SimpleCurrency

class SimpleCurrencyTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // test storage has data or not - this will pass when storage has successfully loaded with data (till user click convert button for the first time it won't pass)
    func testStorage() throws {
        var currencies: Currency?
        let recievedData = Storage.retrieve(storageKey.pairCurrencies, from: .documents, as: Currency.self)
        currencies = recievedData
        XCTAssertEqual(currencies?.result, "success")
    }
    
    // test pair url
    let apiService: APIServiceProtocol = APIService()
    var currencyInValue = "GBP"
    var currencyOutValue = "EUR"
    var currencyValue = "1"
    func testUrl() throws{
        let urlString = apiService.pairConversionUrl(currencyInCode: self.currencyInValue, currencyOutCode: self.currencyOutValue, amount: self.currencyValue)
    let sampleUrl = "https://v6.exchangerate-api.com/v6/7912b8457e7c54b435870faa/pair/GBP/EUR/1"
    XCTAssertEqual(urlString, sampleUrl)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
