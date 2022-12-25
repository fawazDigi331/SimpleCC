//
//  APIService.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import Foundation

protocol APIServiceProtocol: AnyObject {
    var allCurrenciesUrl: String { get }
    func pairConversionUrl(currencyInCode: String, currencyOutCode: String, amount: String) -> String
    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> ())
    func getPairCurrencies(currencyInCode: String, currencyOutCode: String, amount: String, completion: @escaping ([String: Any]?, Error?) -> ())
}

class APIService: APIServiceProtocol {
    var currencies: Currency?
    func getAllCurrencies(completion: @escaping ([String : Any]?, Error?) -> ()) {
        if let url = URL(string: allCurrenciesUrl){
            fetchJSON(url: url, completion: completion)
        }
    }
    
    func getPairCurrencies(currencyInCode: String, currencyOutCode: String, amount: String, completion: @escaping ([String: Any]?, Error?) -> ()) {
        let urlString = pairConversionUrl(currencyInCode: currencyInCode, currencyOutCode: currencyOutCode, amount: amount)
        if let url = URL(string: urlString){
            fetchJSON(url: url, completion: completion)
        }
    }
    
    // Base or Default currency is USD
    var allCurrenciesUrl: String {
        return "\(urls.liveBaseUrl)/latest/USD"
    }
    
    func pairConversionUrl(currencyInCode: String, currencyOutCode: String, amount: String) -> String {
        print("Pair Currency URL: \(urls.liveBaseUrl)pair/\(currencyInCode)/\(currencyOutCode)/\(amount)")
        return "\(urls.liveBaseUrl)pair/\(currencyInCode)/\(currencyOutCode)/\(amount)"
    }
    
    // MARK: Private method of common fetch json method to call with any API calls
    private func fetchJSON(url: URL, completion: @escaping ([String: Any]?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch JSON:", err)
                completion(nil, err)
                return
            }
            
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Currency.self, from: data)
                self.currencies = response
               
                print("Pair Currencies: \(String(describing: self.currencies))")
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                completion(json, nil)
                Storage.store(self.currencies, to: .documents, as: "PairCurrencies.json")
                return
            }
            catch let jsonErr {
                print("Failed to load:", jsonErr)
                completion(nil, jsonErr)
                return
            }
        }.resume()
    }
}
