//
//  Frota.swift
//  Viacao Uniao
//
//  Created by Daniel on 25/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

public class FrotaController
{
    public static let sharedInstance = FrotaController()

    // Database Reference
    var databaseRef = FIRDatabase.database().reference().child("Database")
    
    func getAllFrotas(item: NSDictionary) -> [Frota]
    {
        var frotas: [Frota] = [Frota]()
        
        for i in item.allValues
        {
            let frota: Frota = Frota(item: i as! NSDictionary)
            frotas.append(frota)
        }
        
        return frotas
    }
}
