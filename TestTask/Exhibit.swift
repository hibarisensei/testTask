//
//  Exhibit.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit
import Gloss
protocol IExhibitsLoader: class {
    func getExhibitList(handler:ProductList)
}

class Exhibit: NSObject {
    weak var delegate: IExhibitsLoader?{
        didSet{
           getProduct()
        }
    }
    override init() {
        super.init()
    }
    private func getProduct(){
        guard let path = Bundle.main.path(forResource: "test", ofType: "json")else{
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let jsonResultJSON = jsonResult as? JSON else {
                return
            }
            guard let productList = ProductList.init(json: jsonResultJSON) else{
                return
            }
            delegate?.getExhibitList(handler: productList)
        } catch {
            // handle error
        }
    }
}
struct ProductList:Gloss.JSONDecodable{
    let products:[Product]
    init?(json: JSON) {
        let productsJSON:[JSON] = "list" <~~ json ?? []
        self.products = [Product].from(jsonArray: productsJSON) ?? []

    }

}
struct Product:Gloss.JSONDecodable {
    let title:String
    let images:[String]
    init?(json: JSON) {
        self.title = "title" <~~ json ?? ""
        self.images = "images" <~~ json ?? []
    }
}
