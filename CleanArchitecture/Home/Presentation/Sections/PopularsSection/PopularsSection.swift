//
//  PopularsSection.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import UIKit

protocol PopularsSectionDelegate: AnyObject {
    func popularsSection(_ section: PopularsSection, didSelect item: Dish)
}

class PopularsSection: SectionsLayout {
    typealias ItemsType = Dish
    
    var items: [Dish] = []
        
    
     weak var delegate: PopularsSectionDelegate?
    init(items: [ItemsType]) {
        self.items = items
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let header = createHeader()

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 6
        section.contentInsets.bottom = 25
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: HeaderCollectionReusableView.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return header
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell: DishPortraitCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.setup(dish: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        delegate?.popularsSection(self, didSelect: item)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath
        ) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        header.setupHeaderTitle(title: "Populars")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(DishPortraitCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: HeaderCollectionReusableView.elementKind,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
