//
//  ListDishesCollectionViewCell.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit

class ListDishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup Methods
    func setup(dish: Dish) {
        let imageURL = dish.image
        dishImageView.load(urlString: imageURL ?? "")      
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
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
