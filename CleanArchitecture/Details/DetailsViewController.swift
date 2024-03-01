//
//  DetailsViewController.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    var dish: Dish
    
    // MARK: - IBOutlets
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    // MARK: - Initialization
    init(dish: Dish) {
        self.dish = dish
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showDishDetails()
    }
    
    private func showDishDetails() {
        let imageURL = dish.image
        dishImage.load(urlString: imageURL ?? "")
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        detailsStackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        detailsStackView.isLayoutMarginsRelativeArrangement = true
        
        configureTitleLabelUI()
        configureDescriptionUI()
        configureCaloriesLabelUI()
    }
    
    private func configureTitleLabelUI() {
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }
    
    private func configureDescriptionUI() {
        descriptionLabel.textColor = .gray
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    private func configureCaloriesLabelUI() {
        caloriesLabel.textColor = .red
        caloriesLabel.font = .systemFont(ofSize: 13, weight: .medium)
    }
}
