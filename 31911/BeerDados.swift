//
//  BeerDados.swift
//  31911
//
//  Created by Alexandre Cini on 10/12/2017.
//  Copyright © 2017 Alexandre Cini. All rights reserved.
//

import Foundation
class BeerDados {
    
    //* Dados de uma cerveja
    var id: Int
    var name: String
    var abv: Float
    var ibu: Float
    var tag: String
    var description: String
    var imageURL: String
    
    
    init(id: Int, name: String, tag: String, description: String, imageURL: String, abv: Float, ibu: Float) {
    
        //* Recupera informacoes de uma cerveja
        self.id = id
        self.name = name
        self.tag = tag
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        
    }
    
}
