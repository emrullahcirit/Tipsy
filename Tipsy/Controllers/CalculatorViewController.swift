//
//  ViewController.swift
//  Tipsy
//
//  Created by Muhammed Emrullah Cirit on 19.12.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTipButton = ""
    var tip = 0.00
    var numberOfPeople = 0.00
    var totalCostPerPerson = ""
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        selectedTipButton = sender.currentTitle!
        
        let buttonTitleRemovePctSign = String(selectedTipButton.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleRemovePctSign)!
        tip = buttonTitleAsNumber / 100
        
        

    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        numberOfPeople = Double(splitNumberLabel.text!)!
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Double(billTextField.text!) ?? 1.00
        let totalTip = totalBill * tip
        totalCostPerPerson = String(format: "%.2f", (totalBill + totalTip) / numberOfPeople)
        print(totalCostPerPerson)
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBillPerPerson = totalCostPerPerson
            destinationVC.tipTitle = selectedTipButton
            destinationVC.totalPeople = Int(numberOfPeople)
        }
    }
    
}

