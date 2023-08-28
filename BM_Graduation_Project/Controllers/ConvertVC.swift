//
//  ConvertVC.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 23/08/2023.
//

import UIKit
import iOSDropDown
import SDWebImage
typealias settingTableView = UITableViewDelegate & UITableViewDataSource
class ConvertVC: UIViewController {
    var inst = favouriteCellTableViewCell()
    @IBOutlet weak var sourceAmount: UITextField!
    @IBOutlet weak var sourceCurrency: DropDown!
    @IBOutlet weak var toAmount: UITextField!
    @IBOutlet weak var toCurrency: DropDown!
    @IBOutlet weak var FavouriteTableview: UITableView!
    @IBOutlet weak var addtoFavouriteBtn: UIButton!
  
    var favArr: [Favourite] = []
    var convArr: Convert? 
    var favlist: MyFavourite?
    override func viewDidLoad() {
        super.viewDidLoad()
        settingupUI()
        FavouriteTableview.register(UINib(nibName: "favouriteCellTableViewCell", bundle: nil), forCellReuseIdentifier: "favouriteCellTableViewCell")
        gettData()
        
    }
    func gotoFavourite(){
        
        let sb = UIStoryboard(name:"Main", bundle:nil) // create instance
        let favouriteVC = sb.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
        favouriteVC.delegate = self
        self.present(favouriteVC, animated: true)
        
    }
    
    @IBAction func convertBtn(_ sender: UIButton) {
        getConvertData()
    }
    
    @IBAction func addToFavouriteBtn(_ sender: UIButton) {
        
        gotoFavourite()
    }
}
extension ConvertVC: CurrencyFavoriting {
    func favorite(currency: [Favourite]) {
      
       favArr.append(contentsOf: currency)
        FavouriteTableview.reloadData()
    }
}
extension ConvertVC {
//    func getRates() {
//        APIManager.getRatesData(data: Rates(base: inst.currencyRate.text ?? "")) { error, ratesArr in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if let rates = ratesArr?.conversionRates {
//                DispatchQueue.main.async {
//                    self.favlist = ratesArr
//                    self.inst.currencyRate.text = "\(rates)"
//                }
//            }
//        }
//    }
//   func getRates() {
//       APIManager.getRatesData(data: Rates(base: inst.currencyRate.text ?? "")) { error, ratesArr in
//           if let error = error {
//               print(error)
//               return
//           }
//           if let data = ratesArr {
//               DispatchQueue.main.async {
//                    self.favlist = ratesArr
//                   self.inst.currencyRate.text = "\(self.favlist?.conversionRates ?? 0.0)"
//               }
//
//           }
//       }
    func getConvertData() {
        APIManager.getConvertData(data: DataToConvert(amount: sourceAmount.text ?? "", base: sourceCurrency.text ?? "", target: toCurrency.text ?? "")) { error, data in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                     self.convArr = data
                    self.toAmount.text = "\(self.convArr?.conversionResult ?? 0.0)"
                }

            }

        }
    }
    func gettData() {
        APIManager.getFavouriteData {  error , data in
            
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                self.favArr = data
                    self.toCurrency.optionArray = self.favArr.map{
                        self.getFlagEmoji(flag: $0.code ?? " ") + ($0.code ?? "")
                    } as! [String]
                    
                    self.sourceCurrency.optionArray = self.favArr.map{
                        self.getFlagEmoji(flag: $0.code ?? " ") + ($0.code ?? "")
                    } as! [String]
                   
                    }
                }
                
            }
                        
        }
    func getFlagEmoji(flag: String) -> String{
        let code = flag.dropLast()
            let base: UInt32 = 127397
            var emoji = ""
            for scalar in code.unicodeScalars {
                emoji.append(String(UnicodeScalar(base + scalar.value)!))
            }
            return emoji
        }
    
    }

    extension ConvertVC :settingTableView {
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCellTableViewCell", for: indexPath) as! favouriteCellTableViewCell
            let currency = favArr[indexPath.row]
            cell.imageCurrency.sd_setImage(with: URL(string: currency.flagURL!))
            cell.currencyName.text = currency.name
            cell.currencyLabel.text = currency.code
    
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            favArr.count
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
    

