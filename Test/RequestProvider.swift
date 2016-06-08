//
//  RequestProvider.swift
//  Test
//
//  Created by Srikanth Adavalli on 5/31/16.
//  Copyright © 2016 Srikanth Adavalli. All rights reserved.
//

import Foundation

protocol RequestProvider {
    func getShoppingItemsRequest() -> NSURLRequest?
}

class RequestProviderImpl: RequestProvider {
    func getShoppingItemsRequest() -> NSURLRequest? {
        let urlString: NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string: "http://www.petesalvo.com/products.json")!)
        return NSMutableURLRequest(URL: urlString.URL!)
    }
}