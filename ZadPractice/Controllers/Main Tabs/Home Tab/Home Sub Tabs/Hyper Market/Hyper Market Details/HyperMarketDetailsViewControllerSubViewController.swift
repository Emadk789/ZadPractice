//
//  x.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 11/01/2021.
//

import UIKit


class HyperMarketDetailsViewControllerSubViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var horizantalCollectionView: UICollectionView!
    
//    var subClassValue: ((_: SubClassValue) -> Void)?
    // MARK: Variables
    var subClassdelegate: SubClassDelegate?
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        horizantalCollectionView.delegate = self
        horizantalCollectionView.dataSource = self
        horizantalCollectionView.allowsMultipleSelection = false
    }
}

// MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HyperMarketDetailsViewControllerSubViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        switch collectionView.tag {
        case 0:
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
            cell1.tintColor = .systemYellow
            cell1.backgroundColor = .systemPink
            if indexPath.item == 0 {
                cell1.layer.borderWidth = 2
                cell1.layer.borderColor = UIColor.blue.cgColor
                
                
            }
            return cell1
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let i = IndexPath(item: 0, section: 0)
        if let firstCell = collectionView.cellForItem(at: i) {
            firstCell.layer.borderWidth = 0
            firstCell.backgroundColor = .systemPink
        }
        
        if indexPath.item == 0 {

            subClassdelegate?.updateCards(with: SubClassValue.offer)
        } else {
            subClassdelegate?.updateCards(with: SubClassValue.other)
        }
        var cell: UICollectionViewCell

        cell = collectionView.cellForItem(at: indexPath)!
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.systemBlue.cgColor

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
        }
        
    }
    

}
// MARK:- HyperMarketDetailsViewControllerSubViewControllerCell
class HyperMarketDetailsViewControllerSubViewControllerCell: UICollectionViewCell {
    override func prepareForReuse() {
        self.layer.borderWidth = 0
    }
}
