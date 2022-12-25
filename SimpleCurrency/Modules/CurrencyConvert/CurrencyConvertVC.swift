//
//  CurrencyConvertVC.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import UIKit

protocol CurrencyConvertViewProtocol: AnyObject {
    func updateValue()
}

class CurrencyConvertVC: UIViewController, CurrencyConvertViewProtocol {

    @IBOutlet weak var currencyInLabel: UILabel!
    @IBOutlet weak var currencyOutLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    let configurator: CurrencyConvertConfiguratorProtocol! = CurrencyConvertConfigurator()
    var presenter: CurrencyConvertPresenterProtocol!
    var currencies: Currency?
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func updateValue(){
        let recievedData = Storage.retrieve("PairCurrencies.json", from: .documents, as: Currency.self)
        let currencyAmount = UserDefaults.standard.string(forKey: uds.kCurrencyAmountValue)
        self.currencies = recievedData
        if self.currencies != nil {
            let conversationReslt = self.currencies?.conversionResult
            let currencyOutSymbol = self.currencies?.targetCode
            let currencyInSymbol = self.currencies?.baseCode
            self.currencyInLabel.text = "\(currencyAmount ?? "1") \(currencyInSymbol ?? "")"
            self.currencyOutLabel.text = "\(String(format:"%.2f", conversationReslt ?? 0.00)) \(currencyOutSymbol ?? "")"
        }
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
       let vc = self
       vc.performSegue(withIdentifier: segue.currencyCalculateSegue, sender: self)
    }
}
