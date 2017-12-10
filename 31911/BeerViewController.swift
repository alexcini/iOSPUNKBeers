//
//  BeerViewController.swift
//  31911
//
//  Created by Alexandre Cini on 10/12/2017.
//  Copyright © 2017 Alexandre Cini. All rights reserved.
//

import UIKit
import Kingfisher


class BeerViewController: UIViewController {
    
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbTag: UILabel!
    
    @IBOutlet weak var lbDesc: UILabel!
    
    @IBOutlet weak var lbAbv: UILabel!
    
    @IBOutlet weak var lbIbu: UILabel!
    
    @IBOutlet weak var imBeer: UIImageView!
    
    var beerDet: BeerDados?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - inicia antes de iniciar a view
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        CarregaDetalhes()
   }
    
    // MARK: - Carrega os dados da vindos da segue
    
    func CarregaDetalhes() {
        
        
        if beerDet != nil {
            //-- Obtem informacoes da seg
            let url = ImageResource(downloadURL: URL(string: (beerDet?.imageURL)!)!, cacheKey: beerDet?.name)
            let name = beerDet!.name
            let description = beerDet!.description
            let tag = beerDet!.tag
            let abv = beerDet!.abv
            let ibu = beerDet!.ibu
            //---- Carrega tela
            lbName.text = name
            lbTag.text = tag
            lbDesc.text = description
            lbAbv.text = String(format: "%.1f", abv)
            lbIbu.text = String(format: "%.1f", ibu)
            imBeer.kf.setImage(with: url)
            
        }
        
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
