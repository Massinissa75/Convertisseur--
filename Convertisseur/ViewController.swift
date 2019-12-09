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
}
