//
//  HyperMarketDetailsViewController.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 10/01/2021.
//

import UIKit

enum SubClassValue {
    case offer, other
}
protocol SubClassDelegate {
    func updateCards(with: SubClassValue)
}
// MARK:- HyperMarketDetailsViewController
extension HyperMarketDetailsViewController: SubClassDelegate {
    func updateCards(with value: SubClassValue) {
        currentType = value
    }
}
// MARK:- HyperMarketDetailsViewController
class HyperMarketDetailsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    
    // MARK: Variables
    var hyperMarketSubClass: HyperMarketDetailsViewControllerSubViewController?
    var currentType = SubClassValue.offer {
        didSet {
            verticalCollectionView.reloadData()
        }
    }
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hyperMarketSubClass = segue.destination as? HyperMarketDetailsViewControllerSubViewController {
            self.hyperMarketSubClass = hyperMarketSubClass
            hyperMarketSubClass.subClassdelegate = self
        }
    }

}

// MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HyperMarketDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView.tag {
        case 1:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! HyperMarketDetailsViewControllerCell
            cell2.backgroundColor = .systemFill
            
            switch currentType {
            case .offer:
                cell2.offerLabel.isHidden = false
            case .other:
                cell2.offerLabel.isHidden = true
            }
            
            return cell2
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let numberOfItems: CGFloat = 2
        let numberOfSpasing: CGFloat = 10
        let width = (screenWidth - ((numberOfItems + 1) * numberOfSpasing)) / numberOfItems
        print(width)
        let size: CGSize = CGSize(width: width, height: 200)
        return size
    }
}

// MARK:- HyperMarketDetailsViewControllerCell
class HyperMarketDetailsViewControllerCell: UICollectionViewCell {
    // MARK: Outlets
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var controlView: UIView!
    
    // MARK: Variables
    var itemCount = 1
    
    // MARK: Actions
    @IBAction func addToCartButtonClicked(_ sender: Any) {
        controlView.isHidden = false
    }
    @IBAction func plusButtonClicked(_ sender: Any) {
        itemCount += 1
        quantityLabel.text = "\(itemCount)"
        trashButton.isHidden = true
        minusButton.isHidden = false
    }
    @IBAction func trashButtonClicked(_ sender: Any) {
        controlView.isHidden = true
    }
    @IBAction func minusButtonClicked(_ sender: Any) {
        itemCount -= 1
        quantityLabel.text = "\(itemCount)"
        if itemCount <= 1  {
            
            trashButton.isHidden = false
            minusButton.isHidden = true
        }
    }
}
