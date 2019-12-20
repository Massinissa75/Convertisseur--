//
//  ViewController.swift
//  Convertisseur
//
//  Created by Massinissa.R on 04/12/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var ui_txtField1: UITextField!
  @IBOutlet weak var ui_txtField2: UITextField!
  @IBOutlet weak var ui_labelResult: UILabel!
  
  
  let convert = Convert()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func didTapCovertBtn(_ sender: Any) {
    setupCurrencyData()
  }
    
    //guard ui_txtField1.text  != "" else {
      //presentAlerte()
   // return
    //}
      //ui_txtField1.text = ""
      //ui_labelResult.text = ""
  //}
  
  
  //func awid() {
 //    convert.getConvert { (succes, Rates) in
   // if succes, let rate = Rates {
     //  self.updateRate(rates: Rates!)
       // self.ui_labelResult.text = self.ui_txtField1.text
      //} else {
        //self.presentAlerte()
       //print("fff")
      //}
      //}
  //}
  
  /*private func updateRate(rates: Services) {
    var dollarsUS = Double(ui_txtField1.text!)
    var euroResult = Double(ui_labelResult.text!)
    euroResult = Services
  }*/
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
     ui_txtField1.resignFirstResponder()
   }
  
  func presentAlerte(){
    let alertVC = UIAlertController(title: "Error", message: "The quote download failed.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
  }
  
  
 // data from currency API
  private func setupCurrencyData() {
     var AmountToConvert = 0.0
     guard let AmountInput = ui_txtField1 else {return}
     if let amount = AmountInput.text {
         let amountD = Double(amount)
         AmountToConvert = amountD ?? 0.0
     } else {
         return
     }
     convert.firstAmountToConvert = AmountToConvert
     convert.getConvert() { (success, data) in
         if success, let currentRate = data?.rates?.USD {
             DollarRate.rate = currentRate
             print(currentRate)
             guard let rate = DollarRate.rate else { return }
             let totalConverted = AmountToConvert * rate
             print(totalConverted)
             let formatter = NumberFormatter()
             formatter.numberStyle = .decimal
             formatter.locale = Locale(identifier: "fr_FR")
             //formatter.roundingIncrement = 2
             formatter.minimumFractionDigits = 0
             formatter.maximumFractionDigits = 2
             if let input = formatter.string(for: AmountToConvert) {
                 self.ui_txtField1.text = input + " €"
             }
             if let output = formatter.string(for: totalConverted) {
                 self.ui_labelResult.text = output + " $"
             }
         } else {
          self.presentAlerte()
         }
     }
 }
}
