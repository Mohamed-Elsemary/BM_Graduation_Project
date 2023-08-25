//
//  FavouriteViewController.swift
//  BM_Graduation_Project
//
//  Created by mohamed on 25/08/2023.
//

import UIKit
class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var newFavouriteTableView: UITableView!
    let array = [CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),
                 CurrencyModel(image: UIImage(named: "USA")!, name: "AED", amount: "1234"),
                 CurrencyModel(image: UIImage(named: "USA")!, name: "EGP", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"), CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234"),CurrencyModel(image: UIImage(named: "USA")!, name: "USD", amount: "1234")]
    override func viewDidLoad() {
        super.viewDidLoad()
        newFavouriteTableView.delegate = self
        newFavouriteTableView.dataSource = self
        newFavouriteTableView.register(UINib(nibName: "outsideFavouriteCellTableViewCell", bundle: nil), forCellReuseIdentifier: "outsideFavouriteCellTableViewCell")
    }
    
    @IBAction func exitBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension FavouriteViewController :settingTableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outsideFavouriteCellTableViewCell", for: indexPath) as! outsideFavouriteCellTableViewCell
        cell.imageCurrency.image = array[indexPath.row].image
        cell.currencyName.text = array[indexPath.row].name
        //button ?
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
}
