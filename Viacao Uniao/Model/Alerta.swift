//
//  Alerta.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Alerta
{
    public private(set) var Descricao: String = ""
    public private(set) var Frota: String = ""
    public private(set) var Latitude: String = ""
    public private(set) var Longitude: String = ""
    
    init() {}
    init(item: NSDictionary)
    {
        self.Descricao = item.value(forKey: "Descrição") as? String ?? ""
        self.Frota = item.value(forKey: "Frota") as? String ?? ""
        self.Latitude = item.value(forKey: "Latitude") as? String ?? ""
        self.Longitude = item.value(forKey: "Longitude") as? String ?? ""
    }
}
