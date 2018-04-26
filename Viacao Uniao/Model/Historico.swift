//
//  Historico.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Historico
{
    public private(set) var UID: String = ""
    public private(set) var Latitude: String = ""
    public private(set) var Longitude: String = ""
    public private(set) var Horario: String = ""
    public private(set) var HorarioSaida: String = ""
    public private(set) var NumeroOnibus: String = ""
    public private(set) var RegistroMotorista: String = ""
    public private(set) var LinhaFrota: String = ""
    
    init() {}
    init(item: NSDictionary)
    {
        self.UID = item.value(forKey: "UID") as? String ?? ""
        self.Latitude = item.value(forKey: "Latitude") as? String ?? ""
        self.Longitude = item.value(forKey: "Longitude") as? String ?? ""
        self.Horario = item.value(forKey: "Horario") as? String ?? ""
        self.HorarioSaida = item.value(forKey: "HorarioSaida") as? String ?? ""
        self.NumeroOnibus = item.value(forKey: "NumeroOnibus") as? String ?? ""
        self.RegistroMotorista = item.value(forKey: "RegistroMotorista") as? String ?? ""
        self.LinhaFrota = item.value(forKey: "Linha") as? String ?? ""
    }
}
