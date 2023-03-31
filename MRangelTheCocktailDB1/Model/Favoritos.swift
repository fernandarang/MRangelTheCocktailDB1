//
//  Favoritos.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 09/03/23.
//

import Foundation
import UIKit
import CoreData

struct FavoritosModel {
    var idDrink : String
    var strDrink : String
    var strDrinkThumb : String
    
    init(idDrink: String, strDrink: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkThumb = strDrinkThumb
    }
    
    init(){
        self.idDrink = ""
        self.strDrink = ""
        self.strDrinkThumb = ""
    }
}

class Fav{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func Add(favoritos : FavoritosModel) -> Result{
        
        var result = Result()
        
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "Favoritos", in: context)
            let favoritosCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            favoritosCoreData.setValue(favoritos.idDrink, forKey: "idDrink")
            favoritosCoreData.setValue(favoritos.strDrink, forKey: "strDrink")
            favoritosCoreData.setValue(favoritos.strDrinkThumb, forKey: "strDrinkThumb")
            
            try! context.save()
            result.Correct = true
            
        }catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetAll() -> Result {
        var result = Result()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favoritos")
        
        do {
            let favoritos = try context.fetch(request)
            result.Objects = [Favoritos]()
            for objFavorito in favoritos as! [NSManagedObject] {
                var favorito = FavoritosModel()
                
                favorito.idDrink = objFavorito.value(forKey: "idDrink") as! String
                favorito.strDrink = objFavorito.value(forKey: "strDrink") as! String
                favorito.strDrinkThumb = objFavorito.value(forKey: "strDrinkThumb") as! String
                
                result.Objects?.append(favorito)
            }
            result.Correct = true
            
        } catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func Delete(IdDrink : String) -> Result {
        var result = Result()
        let context = appDelegate.persistentContainer.viewContext
        let entidad = NSEntityDescription.entity(forEntityName: "Favoritos", in: context)
        let request : NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
        request.entity = entidad
        let predicate = NSPredicate(format: "SELF = \(IdDrink)")
        request.predicate = predicate
        do{
            let results = try! context.fetch(request)
            if results.isEmpty{
                result.Correct = true
            }else {
                let objDelete = results[0] as NSManagedObject
                context.delete(objDelete)
            }
            
            try! context.save()
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
     
}
