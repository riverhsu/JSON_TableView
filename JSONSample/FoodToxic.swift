//
//  FoodToxic.swift
//  JSONSample
//
//  Created by Sgmedical on 2016/11/14.
//  Copyright © 2016年 Sgmedical. All rights reserved.
//

import Foundation

class FoodToxic{
    var foodName: String?
    var toxics: [String]
    
    init(foodName iFood: String, toxics itocixs: [String]){
        foodName = iFood
        toxics = itocixs
    }
}
