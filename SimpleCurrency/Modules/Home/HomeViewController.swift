//
//  HomeViewController.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func configCurrencyInPicker()
    func configCurrencyOutPicker()
    func configureKeyboard()
    func setCurrencyInValue(with value: String?)
    func setCurrencyInCode(with code: String)
    func setCurrencyOutCode(with code: String)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol!
    let configurator: HomeConfiguratorProtocol! = HomeConfigurator()
    let currencyList = Locale.isoCurrencyCodes.compactMap { Locale.current.localizedString(forCurrencyCode: $0) }
    
    
    // MARK: outlets and basic configurations
    
    @IBOutlet weak var amountTextField: UITextField!{
        didSet{
            amountTextField.keyboardType = .decimalPad
        }
    }
   
    @IBOutlet weak var CurrencyInTextField: UITextField!
    @IBOutlet weak var currencyOutTextField: UITextField!
    
    // MARK: Initialize variables
    let currencyInPicker = UIPickerView()
    let currencyOutPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: Button Actions
    @IBAction func swapButtonTapped(_ sender: Any) {
    }
    @IBAction func calculateButtonTapped(_ sender: Any) {
    }
    
    // MARK: Methods for HomeViewProtocol
    
    // Dismiss the keyboard when touch outside
    func configureKeyboard(){
         hideKeyboardWhenTappedAround()
    }
    
    func configCurrencyInPicker() {
        self.currencyInPicker.delegate = self
        self.currencyInPicker.dataSource = self
        self.CurrencyInTextField.inputView = currencyInPicker
    }
    
    func configCurrencyOutPicker() {
        self.currencyOutPicker.delegate = self
        self.currencyOutPicker.dataSource = self
        self.currencyOutTextField.inputView = currencyInPicker
    }
    
    func setCurrencyInValue(with value: String?) {
        <#code#>
    }
    
    func setCurrencyInCode(with code: String) {
        <#code#>
    }
    
    func setCurrencyOutCode(with code: String) {
        <#code#>
    }

}

// MARK: UIPickerView Delegates
extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // for the moment set the same order list of local currency for both currecy In and currency Out - Later we can separate it or filter it
        let row = currencyList[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == currencyInPicker{
            self.CurrencyInTextField.text = currencyList[row]
            // save selected currencyIn code here
        }
        else if pickerView == currencyOutPicker{
            self.currencyOutTextField.text = currencyList[row]
            // save selected currencyOut code here
            
        }
    }
}
