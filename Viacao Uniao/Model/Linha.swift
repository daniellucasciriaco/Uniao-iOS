//
//  Linha.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation

public class Linha
{
    public private(set) var UID: String = ""
    public private(set) var Nome: String = ""
    public private(set) var Pontos: [Ponto] = [Ponto]()
    public private(set) var TrajetoLinha: [Trajeto] = [Trajeto]()
    public private(set) var HorariosLinha: [Horarios] = [Horarios]()
    
    init() {}
    init(item: NSDictionary)
    {
        self.UID = item.value(forKey: "UID") as? String ?? ""
        self.Nome = item.value(forKey: "Nome") as? String ?? ""
        
        //Objects
        
        let dataPonto = item.value(forKey: "Pontos") as? NSDictionary ?? NSDictionary()
        
        if(dataPonto.allValues.count > 0)
        {
            for item in dataPonto.allValues
            {
                let ponto = Ponto(item: item as! NSDictionary)
                self.Pontos.append(ponto)
            }
        }
        
        let dataTrajeto = item.value(forKey: "Trajeto") as? NSDictionary ?? NSDictionary()
        
        if(dataTrajeto.allValues.count > 0)
        {
            for item in dataTrajeto.allValues
            {
                let trajeto = Trajeto(item: item as! NSDictionary)
                self.TrajetoLinha.append(trajeto)
            }
        }
        
        let dataHorarios = item.value(forKey: "Horários") as? NSDictionary ?? NSDictionary()
        
        if(dataHorarios.allValues.count > 0)
        {
            for item in dataHorarios.allValues
            {
                let horarios = Horarios(item: item as! NSDictionary)
                self.HorariosLinha.append(horarios)
            }
        }
    }
}
