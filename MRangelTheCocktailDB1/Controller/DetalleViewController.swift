//
//  DetalleViewController.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 09/03/23.
//

import UIKit

class DetalleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var ImagenCoctel: UIImageView!
    @IBOutlet weak var IngredientesCollection: UICollectionView!
    @IBOutlet weak var AddFavoritos: UIButton!
    
    
    var idDrink : String? = nil
    var drinks = Drink()
    //var drinks = [Drink]()
    var favoritos : FavoritosModel? = nil
    var coctel = Coctel()
    var cocteles = [Coctel]()
    var controller = ViewController()
    var fav = Fav()
    //var favoritos = Favoritos()
    var ingredientes = [Coctel]()
    var ingredients : [String] = []
    var cuantities : [String] = []
    var image = "https://www.thecocktaildb.com/images/ingredients/"
    var imagen : String? = nil
    var nombre : String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IngredientesCollection.dataSource = self
        IngredientesCollection.delegate = self
        
        IngredientesCollection.register(UINib(nibName: "CoctelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoctelCell")
        
        
        loadData()
    }
    
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    */
    
    @IBAction func AddFavoritos(_ sender: UIButton) {
        if ingredientes != nil{
            AddFavoritos.tintColor = .red
        }
        
        print(ingredientes)
        favoritos = FavoritosModel(idDrink: ingredientes[0].idDrink!, strDrink: ingredientes[0].strDrink, strDrinkThumb: ingredientes[0].strDrinkThumb)
        
        let result = fav.Add(favoritos: favoritos!)
        
        if result.Correct{
            let alert = UIAlertController(title: "Confirmación", message: "Cocktail agregado a favoritos correctamente", preferredStyle: .alert)
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default,handler:
                                            { action in
            })
            alert.addAction(Aceptar)
            self.present(alert, animated: false)
        }else{
            
            let alertError = UIAlertController(title: "Error", message: "El cocktail no se pudo agregar a favoritos"+result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alertError.addAction(ok)
            self.present(alertError, animated: false)
        }
    }
    
    func loadData () {
        controller.GetById(idDrink: idDrink!, drink: {requestdata, error in
            if let requestdata1 = requestdata{
                self.ingredientes = requestdata1.drinks! as [Coctel]
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                if self.ingredientes[0].strIngredient1 != nil && self.ingredientes[0].strMeasure1 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient1!)
                    self.cuantities.append(self.ingredientes[0].strMeasure1!)
                }
                if self.ingredientes[0].strIngredient2 != nil && self.ingredientes[0].strMeasure2 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient2!)
                    self.cuantities.append(self.ingredientes[0].strMeasure2!)
                }
                if self.ingredientes[0].strIngredient3 != nil && self.ingredientes[0].strMeasure3 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient3!)
                    self.cuantities.append(self.ingredientes[0].strMeasure3!)
                }
                if self.ingredientes[0].strIngredient4 != nil && self.ingredientes[0].strMeasure4 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient4!)
                    self.cuantities.append(self.ingredientes[0].strMeasure4!)
                }
                if self.ingredientes[0].strIngredient5 != nil && self.ingredientes[0].strMeasure5 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient5!)
                    self.cuantities.append(self.ingredientes[0].strMeasure5!)
                }
                if self.ingredientes[0].strIngredient6 != nil && self.ingredientes[0].strMeasure6 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient6!)
                    self.cuantities.append(self.ingredientes[0].strMeasure6!)
                }
                if self.ingredientes[0].strIngredient7 != nil && self.ingredientes[0].strMeasure7 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient7!)
                    self.cuantities.append(self.ingredientes[0].strMeasure7!)
                }
                if self.ingredientes[0].strIngredient8 != nil && self.ingredientes[0].strMeasure8 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient8!)
                    self.cuantities.append(self.ingredientes[0].strMeasure8!)
                }
                if self.ingredientes[0].strIngredient9 != nil && self.ingredientes[0].strMeasure9 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient9!)
                    self.cuantities.append(self.ingredientes[0].strMeasure9!)
                }
                if self.ingredientes[0].strIngredient10 != nil && self.ingredientes[0].strMeasure10 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient10!)
                    self.cuantities.append(self.ingredientes[0].strMeasure10!)
                }
                if self.ingredientes[0].strIngredient11 != nil && self.ingredientes[0].strMeasure11 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient11!)
                    self.cuantities.append(self.ingredientes[0].strMeasure11!)
                }
                if self.ingredientes[0].strIngredient12 != nil && self.ingredientes[0].strMeasure12 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient12!)
                    self.cuantities.append(self.ingredientes[0].strMeasure12!)
                }
                if self.ingredientes[0].strIngredient13 != nil && self.ingredientes[0].strMeasure13 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient13!)
                    self.cuantities.append(self.ingredientes[0].strMeasure13!)
                }
                if self.ingredientes[0].strIngredient14 != nil && self.ingredientes[0].strMeasure14 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient14!)
                    self.cuantities.append(self.ingredientes[0].strMeasure14!)
                }
                if self.ingredientes[0].strIngredient15 != nil && self.ingredientes[0].strMeasure15 != nil {
                    self.ingredients.append(self.ingredientes[0].strIngredient15!)
                    self.cuantities.append(self.ingredientes[0].strMeasure15!)
                }
                //DispatchQueue.global().async {
                   // DispatchQueue.main.async {
                        print(self.ingredientes)
                        self.title = self.ingredientes[0].strDrink
                        self.ImagenCoctel.Imagen(URLAddress:"\(self.ingredientes[0].strDrinkThumb)")
                        
                        self.IngredientesCollection.reloadData()
                    }
                }
                
            }
        })
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetalleViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoctelCell", for: indexPath) as! CoctelCollectionViewCell
        
        cell.NombreField.text = ingredients[indexPath.row]
        cell.CategoriaLbl.text = cuantities[indexPath.row]
        let urlImage = self.image + ingredients[indexPath.row] + ".png"
        let cleanUrlImage = urlImage.replacingOccurrences (of: " ",
        with: "%20")
        cell.ImagenCoctel.ImagenIngrediente(URLAddress: cleanUrlImage)
         
        return cell
    }
     
}

extension UIImageView {
    func ImagenCoctel (URLAddress: String){
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
    
    func ImagenIngrediente (URLAddress: String){
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

