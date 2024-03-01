//
//  CategoriesCollectionViewCell.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(categories: DishCategory) {
        categoryName.text = categories.name
        let imageURL = categories.image
        categoryImage.load(urlString: imageURL ?? "")
    }
}
