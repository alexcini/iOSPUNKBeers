//
//  BeerGet.swift
//  31911
//
//  Created by Alexandre Cini on 10/12/2017.
//  Copyright © 2017 Alexandre Cini. All rights reserved.
//

import Foundation
class BeerGet {
    
    private static let API_URL = "https://api.punkapi.com/v2/beers"
    
    static func getBeers(onComplete: @escaping (_ success: [BeerDados]?)->()){
        
        
        guard let url = URL(string: API_URL) else {
            onComplete(nil)
            return
            
        }
        
        let Urlsession = URLSession(configuration: URLSessionConfiguration.default)
        
        let Urlrequest = URLRequest(url: url)
        
        let task = Urlsession.dataTask(with: Urlrequest) { (
            data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Erro na task URL: ", error!.localizedDescription)
                
                onComplete(nil)
            }
            else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        
                        var beers: [BeerDados] = []
                        
                        for beerItem in json {
                            
                            let id = beerItem ["id"] as! Int
                            let imageURL = beerItem["image_url"] as? String
                            
                            
                            let name = beerItem["name"] as? String
                            let tag = beerItem["tagline"] as? String ?? ""
                            let abv = beerItem["abv"] as? Float ?? 0.0
                            let ibu = beerItem["ibu"] as? Float ?? 0.0
                            let description = beerItem["description"] as? String ?? ""
                            
                            print(name)
                            
                            
                            if (imageURL != nil && name != nil) {
                                let beer = BeerDados(id: id,
                                                name: name!,
                                                tag: tag,
                                                description: description,
                                                imageURL: imageURL!,
                                                abv: abv,
                                                ibu: ibu)
                                
                                beers.append(beer)
                                
                                
                                
                                
                            }
                        }
                        onComplete(beers)
                        print("FIM DA LEITURA DE CERVEJAS")
                    }
                    catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }
                else {
                    print("Erro na resposta do GETBeer: ", response.statusCode)
                    onComplete(nil)
                }
            }
            
        }
        task.resume()
    }
}

