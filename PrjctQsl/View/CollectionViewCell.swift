//
//  CollectionViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 11/07/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelcategories: UILabel!
    
    func setModel(SetCollectionModel: Category) {
        self.labelcategories.text = SetCollectionModel.en_name
    }
}
