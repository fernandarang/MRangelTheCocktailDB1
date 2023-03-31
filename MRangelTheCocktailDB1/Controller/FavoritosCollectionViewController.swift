//
//  FavoritosCollectionViewController.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 10/03/23.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class FavoritosCollectionViewController: UICollectionViewController {
    
    let fav = Fav()
    var favoritos = [FavoritosModel]()
    var favorito = FavoritosModel()
    var drink = Drink()
    var drinks = [Drink]()
    var idDrink : String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        //delete()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.register(UINib(nibName: "FavoritosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavoritoCell")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        //delete()
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func loadData() {
            let result = fav.GetAll()
            if result.Correct{
                favoritos = result.Objects! as! [FavoritosModel]
                collectionView.reloadData()
            }
            else{
                //ALERT
                let alertError = UIAlertController(title: "Error", message: "Error al mostrar los cocktails"+result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default)
                alertError.addAction(ok)
                self.present(alertError, animated: false)
            }
        }
    
    //func delete(){
       // self.idDrink = self.favoritos[0].idDrink
        //let result =
        
    //}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return favoritos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritoCell", for: indexPath) as! FavoritosCollectionViewCell
        
        cell.nombreLbl.text = favoritos[indexPath.row].strDrink
        cell.ImagenCocktail.ImagenFav(URLAddress: "\(favoritos[indexPath.row].strDrinkThumb)")
        cell.ImagenCocktail.layer.cornerRadius = 12
    
        
        cell.EliminarFav.addTarget(self, action: #selector(eliminar), for: .touchUpInside)
        cell.EliminarFav.tag = indexPath.row
        // Configure the cell
    
        return cell
    }
    
    @objc func eliminar (sender : UIButton){
        let coctel = self.favoritos[sender.tag].idDrink
        delete(iddrink: coctel)
    }
    
    func delete(iddrink : String){
        let result = fav.Delete(IdDrink: iddrink)
        if result.Correct {
            
        }else{
            
        }
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension UIImageView {
    func ImagenFav (URLAddress: String){
        guard let url = URL(string: URLAddress) else{
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url)else{return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
