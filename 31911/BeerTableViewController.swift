//
//  BeerTableViewController.swift
//  31911
//
//  Created by Alexandre Cini on 10/12/2017.
//  Copyright © 2017 Alexandre Cini. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewController: UITableViewController {

    
    
    lazy var listaBeer = [BeerDados]()
    var beerInf: BeerDados?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BeerGet.getBeers { beerListResult in
            guard let detBeer = beerListResult else { return }
            
            DispatchQueue.main.async {
                
                self.listaBeer = detBeer;
                self.tableView.reloadData();
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Carga das celulas da tabela
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Obtem o numero da celula
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count cerva:",listaBeer.count)
        return listaBeer.count
    }

        // MARK: - Carrega as celulas com valores do PUNKBeer
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let url = ImageResource(downloadURL: URL(string: listaBeer[indexPath.row].imageURL)!,
                                cacheKey: listaBeer[indexPath.row].name)
        
        let abv = String(format: "%.1f", listaBeer[indexPath.row].abv )
        
        cell.imFig.kf.setImage(with: url)
        cell.lbname.text = listaBeer[indexPath.row].name
        cell.lbAbv.text = "Teor alcoólico: \(abv)"
        
        return cell
    }
    
    // MARK: - Navigation para a tela de detalhamento
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        beerInf = listaBeer[indexPath.row]
        performSegue(withIdentifier: "segueDetalhe", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalhe" {
            let beerSegue = segue.destination as! BeerViewController
            beerSegue.beerDet = self.beerInf
        }
    }
}
