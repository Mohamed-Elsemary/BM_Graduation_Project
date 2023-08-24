//
//  ConvertVC.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 23/08/2023.
//

import UIKit

class ConvertVC: UIViewController {
    
    @IBOutlet weak var sourceAmount: UITextField!
    @IBOutlet weak var sourceCurrency: UITextField!
    @IBOutlet weak var toAmount: UITextField!
    @IBOutlet weak var toCurrency: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingupUI()
   
    }
    
    @IBAction func convertBtn(_ sender: Any) {
        
    }
}
extension ConvertVC {
    func settingupUI() {
        sourceAmount.layer.borderWidth = 0.5
        sourceAmount.layer.cornerRadius = 20
        sourceAmount.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        sourceCurrency.layer.borderWidth = 0.5
        sourceCurrency.layer.cornerRadius = 20
        sourceCurrency.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        toAmount.layer.borderWidth = 0.5
        toAmount.layer.cornerRadius = 20
        toAmount.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        toCurrency.layer.borderWidth = 0.5
        toCurrency.layer.cornerRadius = 20
        toCurrency.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
    }
    
}

