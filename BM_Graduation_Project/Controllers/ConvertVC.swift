//
//  ConvertVC.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 23/08/2023.
//

import UIKit
import iOSDropDown
typealias settingTableView = UITableViewDelegate & UITableViewDataSource
class ConvertVC: UIViewController {
    
    @IBOutlet weak var sourceAmount: UITextField!
    @IBOutlet weak var sourceCurrency: DropDown!
    @IBOutlet weak var toAmount: UITextField!
    @IBOutlet weak var toCurrency: DropDown!
    @IBOutlet weak var FavouriteTableview: UITableView!
    @IBOutlet weak var addtoFavouriteBtn: UIButton!
    let array = [CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),
                 CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),
                 CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingupUI()
        FavouriteTableview.register(UINib(nibName: "favouriteCellTableViewCell", bundle: nil), forCellReuseIdentifier: "favouriteCellTableViewCell")
        
    }
    func gotoFavourite(){
        let sb = UIStoryboard(name:"Main", bundle:nil) // create instance
        let favouriteVC = sb.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
        self.present(favouriteVC, animated: true)
    }
    
    @IBAction func convertBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func addToFavouriteBtn(_ sender: UIButton) {
        gotoFavourite()
    }
}

extension ConvertVC :settingTableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCellTableViewCell", for: indexPath) as! favouriteCellTableViewCell
       cell.imageCurrency.image = array[indexPath.row].image
       cell.currencyRate.text = array[indexPath.row].amount
       cell.currencyName.text = array[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
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
        
        addtoFavouriteBtn.layer.borderWidth = 0.91
        addtoFavouriteBtn.layer.cornerRadius = 18.12
        addtoFavouriteBtn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
    }
    
}

