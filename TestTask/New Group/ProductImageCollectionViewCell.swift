//
//  ProductImageCollectionViewCell.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit
import SDWebImage
class ProductImageCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "idProductImageCollectionViewCell"
    static let cellNib = "ProductImageCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
