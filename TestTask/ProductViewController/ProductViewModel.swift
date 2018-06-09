//
//  ProductViewModel.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit

class ProductViewModel: NSObject {
    var didChangeProducts: (() -> Void)?
    
    private(set) var product:[Product] = []{
        didSet{
        }
    }
    var count:Int{
        get{
            return product.count
        }
    }
    private let exhibit:Exhibit = Exhibit()
    override init(){
        super.init()
        exhibit.delegate = self
    }
    func productCellViewModel(from indexPath: IndexPath) -> ProductCellViewModel{
        return ProductCellViewModel(product: product[indexPath.row])
    }
    func getData(){
        didChangeProducts!()
    }
}
extension ProductViewModel:IExhibitsLoader{
    func getExhibitList(handler: ProductList) {
        product = handler.products
    }
}
