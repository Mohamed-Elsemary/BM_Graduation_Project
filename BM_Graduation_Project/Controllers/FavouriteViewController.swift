//  FavouriteViewController.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 25/08/2023.
import UIKit
import SDWebImage
protocol CurrencyFavoriting: AnyObject {
    func favorite (currency: [Favourite])
}
class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var newFavouriteTableView: UITableView!
    //    week var delegste: CurrencyFavoriting?
    //    var currencies: currency a
    //    IndAXPAthE odexPathi
    //    var currencies: [Currency] = []
    //    var currencyListService: CurreciesListServicing!
    
    weak var delegate: CurrencyFavoriting?
    var IndexPath: IndexPath!
    var favArr: [Favourite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Mark: can be made from main.storyboard
        newFavouriteTableView.delegate = self
        newFavouriteTableView.dataSource = self
        // Registeration
        newFavouriteTableView.register(UINib(nibName: cells.outsideFavouriteCell, bundle: nil), forCellReuseIdentifier: cells.outsideFavouriteCell)
        
        getData()
    }
    
    @IBAction func exitBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate?.favorite(currency: favArr)
    }
    
}

extension FavouriteViewController :settingTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells.outsideFavouriteCell, for: indexPath) as! outsideFavouriteCellTableViewCell
        cell.currN.text = favArr[indexPath.row].name
        cell.currencyName.text = favArr[indexPath.row].code
        let image = favArr[indexPath.row].flagURL
        if let flag = URL(string: image ?? "") {
            cell.imageCurrency.sd_setImage(with: flag )
        }
        //button ?
        return cell
    }
    func getData() {
        APIManager.getFavouriteData {  error , data in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.favArr = data
                    self.newFavouriteTableView.reloadData()
                    
                }
                
            }
            
        }
    }
}



//    let array = [CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),
//                 CurrencyModel(image: UIImage(named: "USA")!, name: "AED", amount: "1234"),
//                 CurrencyModel(image: UIImage(named: "USA")!, name: "EGP", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234")]
