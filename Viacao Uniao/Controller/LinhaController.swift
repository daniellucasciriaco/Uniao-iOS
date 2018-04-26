//
//  LinhaController.swift
//  Viacao Uniao
//
//  Created by Daniel on 27/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

public class LinhaController
{
    public static let sharedInstance = LinhaController()
    
    // Database Reference
    var databaseRef = FIRDatabase.database().reference().child("Database")
    
    func getAllLinhas(item: NSDictionary) -> [Linha]
    {
        var linhas: [Linha] = [Linha]()
        
        for i in item.allValues
        {
            let linha: Linha = Linha(item: i as! NSDictionary)
            linhas.append(linha)
        }
        
        return linhas
    }
}
