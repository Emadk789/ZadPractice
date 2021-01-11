//
//  HomeViewController.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

// MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
        
        
        switch indexPath.item {
        case 0:
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! HyperMarketCollectionViewCell
            cell1.backgroundColor = .systemBlue
            cell1.label.text = "Hyper Market"
            cell1.hyperMarketDetailsBlock = { [weak self] in
                let hyperMarketDetailsViewController = self?.storyboard?.instantiateViewController(identifier: "HyperMarketDetailsViewController") as! HyperMarketDetailsViewController
                self?.show(hyperMarketDetailsViewController, sender: self)
            }
            return cell1

        case 1:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! AdsCollectionViewCell
            cell2.backgroundColor = .systemOrange
            return cell2
        case 2:
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! ShopByBrandCollectionViewCell
            cell3.backgroundColor = .systemTeal
            return cell3
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let hyperMarketDetailsViewController = storyboard?.instantiateViewController(identifier: "HyperMarketDetailsViewController") as! HyperMarketDetailsViewController
            show(hyperMarketDetailsViewController, sender: self)
        case 1:
           break
        case 2:
            break
        default:
            break
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        var cellHeight: CGFloat = 0.0
        
        switch indexPath.item {
        case 0, 1:
            cellHeight = screenWidth / 3
        case 2:
            cellHeight = screenWidth
        default:
            break
        }
        return CGSize(width: screenWidth, height: cellHeight)
    }
    
}


