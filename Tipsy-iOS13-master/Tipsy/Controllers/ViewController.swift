//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var toPayByPerson = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleTip = String(buttonTitle.dropLast())
        let buttonTitleTipNumeric = Double(buttonTitleTip)!
        tip = buttonTitleTipNumeric / 100
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amount = billTextField.text!
        if amount != "" {
            billTotal = Double(amount)!
            toPayByPerson = (billTotal + (tip * billTotal)) / Double(numberOfPeople)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResults" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.toPayByPerson = String(format: "%.2f", toPayByPerson)
                destinationVC.tip = Int(tip * 100)
                destinationVC.numberOfPerople = numberOfPeople
            }
        }
}

