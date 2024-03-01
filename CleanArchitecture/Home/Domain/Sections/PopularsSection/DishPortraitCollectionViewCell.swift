//
//  DishPortraitCollectionViewCell.swift
//  TastyBites
//
//  Created by Ibrahim Nasser Ibrahim on 20/12/2023.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

  // MARK: - Properties

     /// A static identifier for the cell.

     // MARK: - Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dishImageView: UIImageView!
  @IBOutlet weak var caloriesLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  // MARK: - Setup Method

     /// Configure the cell with the provided dish information.
     ///
     /// - Parameter dish: The Dish model to display in the cell.
     func setup(dish: Dish) {
         titleLabel.text = dish.name
         caloriesLabel.text = dish.formattedCalories
         descriptionLabel.text = dish.description
         let imageURL = dish.image
         dishImageView.load(urlString: imageURL ?? "")
     }
 }
