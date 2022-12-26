//
//  CurrencyConvertVC.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import UIKit

protocol CurrencyConvertViewProtocol: AnyObject {
    func updateValue()
    func startTimer()
}

class CurrencyConvertVC: UIViewController, CurrencyConvertViewProtocol {

    @IBOutlet weak var currencyInLabel: UILabel!
    @IBOutlet weak var currencyOutLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    let configurator: CurrencyConvertConfiguratorProtocol! = CurrencyConvertConfigurator()
    var presenter: CurrencyConvertPresenterProtocol!
    var currencies: Currency?
    var countdown = 30
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        startTimer()
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
    
    // MARK: Countdown timer Methods
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
    }
    
    @objc func countDownTimer() {
       
        if countdown > 0 {
            timerLabel.text = "\(countdown) sec left"
            countdown -= 1
        }
        
        if countdown == 0 {
            timer?.invalidate()
            // take user to previous screen
            self.endTimerAlert()
            print("Timer Stopped!")
        }
    }
    
    func endTimerAlert(){
        let timerAlert = UIAlertController(title: "Session ended!", message: "You have been asked to start again!.", preferredStyle: UIAlertController.Style.alert)
        
        timerAlert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            DispatchQueue.main.async {
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
        })
    
        self.present(timerAlert, animated: true)
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
       let vc = self
       vc.performSegue(withIdentifier: segue.currencyCalculateSegue, sender: self)
    }
}
