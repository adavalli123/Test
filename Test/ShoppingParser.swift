//
//  ShoppingParser.swift
//  Test
//
//  Created by Srikanth Adavalli on 6/4/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import SwiftyJSON
import Alamofire

class ShoppingParser{
    
    var product: Product!
    
    init(product: Product) {
        self.product = product
    }
    
    func requestMethod(data: NSData) -> ParserResult<Product> {
        let responeJson = JSON(data: data)
        let objectCategory = responeJson
        let response = objectCategory["results"]
        
        for (_, subJson):(String, JSON) in response {
            guard subJson.dictionary != nil else { continue }
            
            guard let prodName = subJson["name1"].string, prodColor = subJson["colorDescription"].string, prodPrice = subJson["prices"]["list"].string, prodThumbimage = subJson["images"][1]["thumb"].string, prodFullImage = subJson["images"][0]["full"].string else {return ParserResult.failure((TestError.init("Error"))) }
            
            guard let productImage: UIImage = stringToImage(prodThumbimage), productFullImage: UIImage = stringToImage(prodFullImage) else
            { return ParserResult.failure((TestError.init("Error")))  }
            product.items.append(Items(productName: prodName, productPrice: prodPrice, productImage: productImage, prodFullImage: productFullImage, prodColor: prodColor))
        }
        return ParserResult.success(product)
    }
    
    private func stringToImage(string : String) -> UIImage? {
        let imageURL = NSURL.init(string: string)
        let data = NSData(contentsOfURL: imageURL!)
        let image = UIImage(data: data!)
        return image!
    }
    
}

