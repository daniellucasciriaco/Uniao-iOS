//
//  Linha.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Horarios
{
    public private(set) var Codigo: String = ""
    public private(set) var Horario: String = ""
    public private(set) var Nome: String = ""
    
    init() {}
    init(item: NSDictionary)
    {
        self.Codigo = item.value(forKey: "Código") as? String ?? ""
        self.Horario = item.value(forKey: "Horário") as? String ?? ""
        self.Nome = item.value(forKey: "Nome") as? String ?? ""
    }
}
