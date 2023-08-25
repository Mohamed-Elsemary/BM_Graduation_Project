//
//  CompareVC.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 23/08/2023.
//

import UIKit
import iOSDropDown
class CompareVC: UIViewController {

    @IBOutlet weak var sourceAmount: UITextField!
    @IBOutlet weak var sourceCurrency: DropDown!
    @IBOutlet weak var firstTargetedAmount: UITextField!
    @IBOutlet weak var secondTargetedAmount: UITextField!
    @IBOutlet weak var firstCurrency: DropDown!
    
    @IBOutlet weak var secondCurrency: DropDown!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingupUI()
    }
}
extension CompareVC {
    func settingupUI() {
        sourceAmount.layer.borderWidth = 0.5
        sourceAmount.layer.cornerRadius = 20
        sourceAmount.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        sourceCurrency.layer.borderWidth = 0.5
        sourceCurrency.layer.cornerRadius = 20
        sourceCurrency.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        firstTargetedAmount.layer.borderWidth = 0.5
        firstTargetedAmount.layer.cornerRadius = 20
        firstTargetedAmount.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        secondTargetedAmount.layer.borderWidth = 0.5
        secondTargetedAmount.layer.cornerRadius = 20
        secondTargetedAmount.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        
        firstCurrency.layer.borderWidth = 0.5
        firstCurrency.layer.cornerRadius = 20
        firstCurrency.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
        secondCurrency.layer.borderWidth = 0.5
        secondCurrency.layer.cornerRadius = 20
        secondCurrency.layer.borderColor = UIColor(red: 197/255.0, green: 197/255.0, blue: 197/255.0, alpha: 1.0).cgColor
    }

    }
