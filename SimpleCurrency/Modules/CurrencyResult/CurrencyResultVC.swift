//
//  CurrencyResultVC.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import UIKit

protocol CurrencyResultViewProtocol: AnyObject {
    func updateValue()
}

class CurrencyResultVC: UIViewController, CurrencyResultViewProtocol {
    let configurator: CurrencyResultConfiguratorProtocol! = CurrencyResultConfigurator()
    var presenter: CurrencyResultPresenterProtocol!
    var currencies: Currency?
    @IBOutlet weak var conversionAmountLabel: UILabel!
    @IBOutlet weak var convertedAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        presenter.doneButtonTapped()
    }
    
    func updateValue() {
        let recievedData = Storage.retrieve(storageKey.pairCurrencies, from: .documents, as: Currency.self)
      self.currencies = recievedData
        if self.currencies != nil {
            let conversationReslt = self.currencies?.conversionResult
            let currencyOutSymbol = self.currencies?.targetCode
            let conversionRate = self.currencies?.conversionRate
            self.convertedAmountLabel.text = "Great now you have \(String(format:"%.2f", conversationReslt ?? 0.00)) \(currencyOutSymbol ?? "") in your account"
            self.conversionAmountLabel.text = "Your convertion rate was 1/\(String(format:"%.2f", conversionRate ?? 0.00))"
         }
     }
}
