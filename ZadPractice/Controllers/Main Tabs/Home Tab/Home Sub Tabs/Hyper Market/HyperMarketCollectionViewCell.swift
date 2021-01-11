//
//  HyperMarketCollectionViewCell.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class HyperMarketCollectionViewCell: UICollectionViewCell {
    // MARK: Outlets
    @IBOutlet weak var label: UILabel!
    // MARK: Variables
    var hyperMarketDetailsBlock: (() ->Void)? = nil
    
}
