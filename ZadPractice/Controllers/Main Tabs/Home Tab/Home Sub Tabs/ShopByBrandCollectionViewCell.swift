//
//  ShopByBrandCollectionViewCell.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class ShopByBrandCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var shopByBrandCollectionView: UICollectionView!
    
    // MARK: Life Cycle Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shopByBrandCollectionView.delegate = self
        shopByBrandCollectionView.dataSource = self
    }
    
    
}

// MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ShopByBrandCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = .systemGray
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let numberOfItems: CGFloat = 4
        let numberOfSpasingForCell: CGFloat = 10
        
        let width = (screenWidth - ((numberOfItems + 1) * numberOfSpasingForCell)) / numberOfItems
        
        
        let size = CGSize(width: width, height: 50)
        
        return size
    }
    
    
}
