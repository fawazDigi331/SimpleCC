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
    func storeValues()
    func swapCurrency()
    
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol!
    var currencyInValue: String?
    var currencyOutValue: String?
    let configurator: HomeConfiguratorProtocol! = HomeConfigurator()
    let currencyInList = ["GBP", "USD", "EUR", "AED", "AUD", "CAD", "SGD", "JPY", "INR", "LKR", "NZD", "KWD", "SAR"]
    let currencyOutList = ["EUR", "SGD", "JPY", "INR", "LKR", "NZD", "KWD", "SAR", "GBP", "USD", "AED", "AUD", "CAD"]
    
    
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
    public weak var toolbarDelegate: UIPickerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
       
    }
    
    // MARK: Button Actions
    @IBAction func swapButtonTapped(_ sender: Any) {
        presenter.swapButtonTapped()
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        if self.amountTextField.text != ""{
        presenter.calculateButtonTapped()
      }
    }
    
    // MARK: Methods for HomeViewProtocol
    // Dismiss the keyboard when touch outside
    func configureKeyboard(){
         hideKeyboardWhenTappedAround()
    }
    
    func configCurrencyInPicker() {
        self.currencyInPicker.delegate = self
        self.currencyInPicker.dataSource = self
        
        // UIPickerView Customization
        self.currencyInPicker.backgroundColor = .white
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemGray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelTapped))
        
        doneButton.tintColor = .systemRed

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.CurrencyInTextField.inputView = currencyInPicker
        self.CurrencyInTextField.inputAccessoryView = toolBar
    }
    
    func configCurrencyOutPicker() {
        self.currencyOutPicker.delegate = self
        self.currencyOutPicker.dataSource = self
        
        // UIPickerView Customization
        self.currencyOutPicker.backgroundColor = .white
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemGray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.outDoneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.outCancelTapped))
        
        doneButton.tintColor = .systemRed

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.currencyOutTextField.inputView = currencyOutPicker
        self.currencyOutTextField.inputAccessoryView = toolBar
    }
    
    func storeValues() {
        var currencyAmount: String?
            UserDefaults.standard.set(self.CurrencyInTextField.text, forKey: uds.kCurrencyInSymbol)
            UserDefaults.standard.set(self.currencyOutTextField.text, forKey: uds.kCurrencyOutSymbol)
            currencyAmount = self.amountTextField.text ?? "1"
            UserDefaults.standard.set(currencyAmount, forKey: uds.kCurrencyAmountValue)
    }
    
    func swapCurrency(){
        DispatchQueue.main.async {
            self.currencyInValue = self.currencyOutTextField.text
            self.currencyOutValue = self.CurrencyInTextField.text
            self.CurrencyInTextField.text = self.currencyInValue ?? "EUR"
            self.currencyOutTextField.text = self.currencyOutValue ?? "GBP"
        }
    }
    

    // MARK: UIPickerView Selectors
    @objc func doneTapped() {
        self.CurrencyInTextField.resignFirstResponder()
    }

    @objc func cancelTapped() {
        self.CurrencyInTextField.resignFirstResponder()
    }

    @objc func outDoneTapped() {
        self.currencyOutTextField.resignFirstResponder()
    }

    @objc func outCancelTapped() {
        self.currencyOutTextField.resignFirstResponder()
    }


}

// MARK: UIPickerView Delegates
extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == currencyInPicker{
            return currencyInList.count
        }
        return currencyOutList.count // for currencyOut picker
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == currencyInPicker{
            let row = currencyInList[row]
            return row
        }
        //for currency out picker
        let row = currencyOutList[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == currencyInPicker{
            self.CurrencyInTextField.text = currencyInList[row]
            // save selected currencyIn code here
        }
        
        if pickerView == currencyOutPicker{
            self.currencyOutTextField.text = currencyOutList[row]
            // save selected currencyOut code here
            
        }
    }
}
