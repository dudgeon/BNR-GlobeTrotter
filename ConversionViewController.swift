//
//  ConversionViewController.swift
//  WorldTrotter-Ch_03
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextViewDelegate {
    
    // MODEL
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter ()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    // VIEW
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    // CONTROLLER
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {

        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
        
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    
    
    
    
    
}
