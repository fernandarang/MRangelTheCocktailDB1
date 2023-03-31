//
//  ViewController.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 09/03/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var BusquedaField: UITextField!
    @IBOutlet weak var CoctelesViewController: UICollectionView!
    
    var cocteles = [Coctel]()
    var coctel = Coctel()
    var drinks = Drink()
    var nombre : String? = nil
    var idDrink : String? = nil
    var image : String = ""
    var bebida : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CoctelesViewController.delegate = self
        CoctelesViewController.dataSource = self
        
        CoctelesViewController.register(UINib(nibName: "CoctelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CoctelCell")
    }
    
    @IBAction func Buscar(_ sender: UIButton) {
        
        guard let nombre = BusquedaField.text, nombre != "" else {
            BusquedaField.placeholder = "Busca un producto.."
            return
        }
        
        self.nombre = nombre
        
        
    
        self.GetByName(name : nombre, drinks: {requestdata, error in
                if let requestdata1 = requestdata {
                        self.drinks = requestdata1
                    
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            print(self.drinks)
                            //self.numero = self.movies.results!.count
                            //self.MoviesCollectionView.reloadData()
                            self.CoctelesViewController.reloadData()
                        }
                    }
                }
                if let error1 = error {
                    print(error1.localizedDescription)
                }
            })
        
        /*
        GetByLetter(letters : nombre,drinks: {requestdata, error in
            if let requestdata1 = requestdata {
                    self.drinks = requestdata1
                
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        print(self.drinks)
                        //self.numero = self.movies.results!.count
                        //self.MoviesCollectionView.reloadData()
                        self.CoctelesViewController.reloadData()

                    }
                }
            }
            if let error1 = error {
                print(error1.localizedDescription)
            }
        })
         */
        
        
        CoctelesViewController.reloadData()
    }
    
    func GetByName(name : String, drinks : @escaping(Drink?, Error?) -> Void){
        //let urlSession = URLSession.shared
        let urlString : String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(name)"
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        let urlSession = URLSession(configuration: .default)
        let decoder = JSONDecoder()
        urlSession.dataTask(with: url!) { data, response, error in
            print("Data \(String(describing: data))")
            print(error)
            guard let data = data else{
                return
            }
            self.drinks = try! decoder.decode(Drink.self, from: data)
            drinks(self.drinks, nil)
            
            if let error = error {
                drinks(nil,error)
            }
        }.resume()
    }
    
    func GetByLetter(letters : String,drinks : @escaping(Drink?, Error?) -> Void){
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(letters)")
        urlSession.dataTask(with: url!) { data, response, error in
            print("Data \(String(describing: data))")
            guard let data = data else{
                return
            }
            self.drinks = try! decoder.decode(Drink.self, from: data)
            drinks(self.drinks, nil)
            
            if let error = error {
                drinks(nil,error)
            }
        }.resume()
    }
    
    func GetById(idDrink : String, drink : @escaping(Drink?, Error?) -> Void){
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)")
        urlSession.dataTask(with: url!) { data, response, error in
            print("Data \(String(describing: data))")
            guard let data = data else{
                return
            }
            self.drinks = try! decoder.decode(Drink.self, from: data)
            drink(self.drinks, nil)
            
            if let error = error {
                drink(nil,error)
            }
        }.resume()
    }
    
    
}
extension ViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.drinks!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoctelCell", for: indexPath) as! CoctelCollectionViewCell
        
        cell.NombreField.text = drinks.drinks![indexPath.row].strDrink
        cell.CategoriaLbl.text = drinks.drinks![indexPath.row].strCategory
        cell.ImagenCoctel.Imagen(URLAddress: "\(drinks.drinks![indexPath.row].strDrinkThumb)")
        cell.ImagenCoctel.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.idDrink = drinks.drinks![indexPath.row].idDrink
    self.performSegue(withIdentifier: "DetalleSegue", sender: self)
        //self.bebida = drinks.drinks![indexPath.row].strDrink
        //self.image = drinks.drinks![indexPath.row].strDrinkThumb
        
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetalleSegue"{
            let detalleController = segue.destination as! DetalleViewController
            detalleController.idDrink = self.idDrink
            //detalleController.imagen = self.image
            //detalleController.nombre = self.bebida
        }
    }
    
    
}
extension UIImageView {
    func Imagen (URLAddress: String){
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

