//
//  ProductTableViewCell.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit
import SDWebImage
class ProductTableViewCell: UITableViewCell {
    static let cellIdentifier = "idProductTableViewCell"
    static let cellNib = "ProductTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var title: UILabel!
    var viewModel: ProductCellViewModel!{
        didSet {
            commonInit()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    private func commonInit(){
        setupCollectionView()
        setupViewModel()
    }
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: ProductImageCollectionViewCell.cellNib, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ProductImageCollectionViewCell.cellIdentifier)
    }
    private func setupViewModel(){
        viewModel.didChangeProduct = {[weak self] in
            self?.title.text = self?.viewModel.product.title
            self?.collectionView.reloadData()
        }
        viewModel.getData()
    }
}
extension ProductTableViewCell:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageCollectionViewCell.cellIdentifier, for: indexPath) as! ProductImageCollectionViewCell
        let imageURLString = viewModel.images[indexPath.row]
        let imageURL = URL(string: imageURLString)
        cell.imageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .highPriority , completed: nil)
        return cell
    }
}
extension ProductTableViewCell: UICollectionViewDelegate{
    
}
