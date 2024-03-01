//
//  SpecialsCollectionViewCell.swift
//  TastyBites
//
//  Created by Ibrahim Nasser Ibrahim on 20/12/2023.
//

import UIKit

class SpecialsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup Method
    
    /// Configure the cell with the provided dish information.
    ///
    /// - Parameter dish: The Dish model to display in the cell.
    func setup(dish: Dish) {
        let imageURL = dish.image
        dishImageView.load(urlString: imageURL ?? "")
        titleLable.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
    private func setupUI() {
        dishImageView.layer.cornerRadius = 5
        configureContainerView()
    }
    
    /// Configures the appearance of the container view, including shadows and corner radius.
    private func configureContainerView() {
        containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        containerView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 5
        containerView.layer.cornerRadius = 20
    }
}
