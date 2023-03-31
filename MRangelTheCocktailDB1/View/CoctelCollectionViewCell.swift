//
//  CoctelCollectionViewCell.swift
//  MRangelTheCocktailDB1
//
//  Created by MacBookMBA5 on 09/03/23.
//

import UIKit

class CoctelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var NombreField: UILabel!
    @IBOutlet weak var ImagenCoctel: UIImageView!
    @IBOutlet weak var CategoriaLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
