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
    func setCurrencyInValue(with value: Int?)
    func setCurrencyInCode(with code: String)
    func setCurrencyOutCode(with code: String)
}

class HomeViewController: UIViewController {
    
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
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Button Actions
    @IBAction func swapButtonTapped(_ sender: Any) {
    }
    @IBAction func calculateButtonTapped(_ sender: Any) {
    }
    
    // MARK: Functions
    
    // Dismiss the keyboard when touch outside

}
