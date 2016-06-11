//
//  Items.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/16/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import UIKit

class Items: Equatable {
    var productName: String
    var productPrice: String
    var productImage: UIImage
    var prodFullImage: UIImage
    var prodColor: String
    
    init(productName: String, productPrice: String, productImage: UIImage, prodFullImage: UIImage, prodColor: String) {
        self.productName = productName
        self.productPrice = productPrice
        self.productImage = productImage
        self.prodFullImage = prodFullImage
        self.prodColor = prodColor
    }
}

func ==(lhs: Items, rhs: Items) -> Bool {
    guard lhs.productName == rhs.productName && lhs.productPrice == rhs.productPrice && lhs.productImage == rhs.productImage && lhs.prodColor == rhs.prodColor else { return false
    }
    return true
}