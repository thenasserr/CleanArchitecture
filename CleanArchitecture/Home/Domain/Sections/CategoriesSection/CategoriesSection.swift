//
//  CategoriesSection.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//
import UIKit

protocol CategoriesSectionDelegate: AnyObject {
    func categoriesSection(_ section: CategoriesSection, didSelect item: DishCategory)
}

class CategoriesSection: SectionsLayout {
    typealias ItemsType = DishCategory
    
    var items: [ItemsType] = []
            
    let delegate: CategoriesSectionDelegate
    
    init(items: [ItemsType], delegate: CategoriesSectionDelegate) {
        self.items = items
        self.delegate = delegate
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let header = createHeader()

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 6
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
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
        guard let cell: CategoriesCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.setup(categories: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        delegate.categoriesSection(self, didSelect: item)
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
        header.setupHeaderTitle(title: "Categories")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CategoriesCollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: HeaderCollectionReusableView.elementKind,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}

