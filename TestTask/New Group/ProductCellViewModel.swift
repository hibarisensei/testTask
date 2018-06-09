//
//  ProductCellViewModel.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit

class ProductCellViewModel: NSObject {
    var didChangeProduct: (() -> Void)?

    var images:[String]{
        get{
            return product.images
        }
    }
    var count:Int{
        get{
            return images.count
        }
    }
    private(set) var product:Product{
        didSet{
            didChangeProduct!()
        }
    }
    
    init(product:Product) {
        self.product = product
        super.init()
    }
    func getData()  {
        didChangeProduct!()
    }
}
