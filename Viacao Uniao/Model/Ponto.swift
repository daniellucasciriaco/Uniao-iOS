//
//  Ponto.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Ponto
{
    public private(set) var UID: String = ""
    public private(set) var Nome: String = ""
    public private(set) var Latitude: String = ""
    public private(set) var Longitude: String = ""
    public private(set) var Linhas: [Linha] = [Linha]()
    
    init() {}
    init(item: NSDictionary)
    {
        self.UID = item.value(forKey: "UID") as? String ?? ""
        self.Nome = item.value(forKey: "Nome") as? String ?? ""
        self.Latitude = item.value(forKey: "Latitude") as? String ?? ""
        self.Longitude = item.value(forKey: "Longitude") as? String ?? ""
        
        //Objects
        let dataLinhas = item.value(forKey: "Linhas") as? NSDictionary ?? NSDictionary() 
        
        if(dataLinhas.allValues.count > 0)
        {
            for item in dataLinhas.allValues
            {
                let linha = Linha(item: item as! NSDictionary)
                self.Linhas.append(linha)
            }
        }
    }
}
