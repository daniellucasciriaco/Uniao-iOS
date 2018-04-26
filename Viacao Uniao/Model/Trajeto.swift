//
//  Trajeto.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Trajeto
{
    public private(set) var Rua: String = ""
    
    init() {}
    init(item: NSDictionary)
    {
        self.Rua = item.value(forKey: "Rua") as? String ?? ""
    }
}
