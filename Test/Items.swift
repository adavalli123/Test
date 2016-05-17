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
    var productPrice: NSNumber
    var productImage: UIImage
    
    init(productName: String, productPrice: NSNumber, productImage: UIImage = UIImage()) {
        self.productName = productName
        self.productPrice = productPrice
        self.productImage = productImage
    }
}

func ==(lhs: Items, rhs: Items) -> Bool {
    guard lhs.productName == rhs.productName && lhs.productPrice == rhs.productPrice && lhs.productImage == rhs.productImage else { return false
    }
    return true
}