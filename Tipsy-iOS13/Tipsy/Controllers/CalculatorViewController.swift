//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var bill: Float = 0.0
    var tip: Float = 0.1
    var splitNumber: Float = 2.0
    var total: Float = 0.0

    @IBOutlet var splitNumberLabel: UILabel!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var billTextField: UITextField!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        
        if sender.currentTitle == "0%"{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.0
        } else if sender.currentTitle == "10%"{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
        } else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitNumber = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Float(billTextField.text!) ?? 0.0
        total = bill * (1 + tip) / splitNumber
      
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            //If the currently triggered segue is the "goToResults" segue.
            if segue.identifier == "goToResults" {
                
                //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
                let destinationVC = segue.destination as! ResultsViewController
                
                //Set the destination ResultsViewController's properties.
                destinationVC.result = String(format: "%.1f", total)
                destinationVC.tip = Int(tip * 100)
                destinationVC.split = Int(splitNumber)
            }
        }
}

