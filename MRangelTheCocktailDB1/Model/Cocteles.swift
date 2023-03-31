//
//  Cocteles.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 09/03/23.
//
import UIKit
import CoreData
import Foundation

var drinks = Drink()

struct Drink : Codable {
    var drinks : [Coctel]?
    
    enum CodingKeys : String, CodingKey {
        case drinks = "drinks"
    }
    
    init(drinks: [Coctel]) {
        self.drinks = drinks
    }
    
    init(){
        self.drinks = [Coctel]()
    }
}

struct Coctel : Codable {
    var idDrink : String?
    var strDrink : String
    var strCategory : String
    var strInstructions : String
    var strDrinkThumb : String
    var strIngredient1 : String?
    var strIngredient2 : String?
    var strIngredient3 : String?
    var strIngredient4 : String?
    var strIngredient5 : String?
    var strIngredient6 : String?
    var strIngredient7 : String?
    var strIngredient8 : String?
    var strIngredient9 : String?
    var strIngredient10 : String?
    var strIngredient11 : String?
    var strIngredient12 : String?
    var strIngredient13 : String?
    var strIngredient14 : String?
    var strIngredient15 : String?
    var strMeasure1 : String?
    var strMeasure2 : String?
    var strMeasure3 : String?
    var strMeasure4 : String?
    var strMeasure5 : String?
    var strMeasure6 : String?
    var strMeasure7 : String?
    var strMeasure8 : String?
    var strMeasure9 : String?
    var strMeasure10 : String?
    var strMeasure11 : String?
    var strMeasure12 : String?
    var strMeasure13 : String?
    var strMeasure14 : String?
    var strMeasure15 : String?
    
    enum CodingKeys : String, CodingKey {
        case idDrink
        case strDrink = "strDrink"
        case strCategory = "strCategory"
        case strInstructions = "strInstructions"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        
    }
    
    init(idDrink: String? = nil, strDrink: String, strCategory: String, strInstructions: String, strDrinkThumb: String, strIngredient1: String? = nil, strIngredient2: String? = nil, strIngredient3: String? = nil, strIngredient4: String? = nil, strIngredient5: String? = nil, strIngredient6: String? = nil, strIngredient7: String? = nil, strIngredient8: String? = nil, strIngredient9: String? = nil, strIngredient10: String? = nil, strIngredient11: String? = nil, strIngredient12: String? = nil, strIngredient13: String? = nil, strIngredient14: String? = nil, strIngredient15: String? = nil, strMeasure1: String? = nil, strMeasure2: String? = nil, strMeasure3: String? = nil, strMeasure4: String? = nil, strMeasure5: String? = nil, strMeasure6: String? = nil, strMeasure7: String? = nil, strMeasure8: String? = nil, strMeasure9: String? = nil, strMeasure10: String? = nil, strMeasure11: String? = nil, strMeasure12: String? = nil, strMeasure13: String? = nil, strMeasure14: String? = nil, strMeasure15: String? = nil) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strCategory = strCategory
        self.strInstructions = strInstructions
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
    }
    
    init(){
        self.idDrink = ""
        self.strDrink = ""
        self.strCategory = ""
        self.strInstructions = ""
        self.strDrinkThumb = ""
        self.strIngredient1 = ""
        self.strIngredient2 = ""
        self.strIngredient3 = ""
        self.strIngredient4 = ""
        self.strIngredient5 = ""
        self.strIngredient6 = ""
        self.strIngredient7 = ""
        self.strIngredient8 = ""
        self.strIngredient9 = ""
        self.strIngredient10 = ""
        self.strIngredient11 = ""
        self.strIngredient12 = ""
        self.strIngredient13 = ""
        self.strIngredient14 = ""
        self.strIngredient15 = ""
        self.strMeasure1 = ""
        self.strMeasure2 = ""
        self.strMeasure3 = ""
        self.strMeasure4 = ""
        self.strMeasure5 = ""
        self.strMeasure6 = ""
        self.strMeasure7 = ""
        self.strMeasure8 = ""
        self.strMeasure9 = ""
        self.strMeasure10 = ""
        self.strMeasure11 = ""
        self.strMeasure12 = ""
        self.strMeasure13 = ""
        self.strMeasure14 = ""
        self.strMeasure15 = ""
    }
    
}

