//
//  PokemonDetailVC.swift
//  pokedex-project
//
//  Created by Kasey Schlaudt on 7/14/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import UIKit


class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { 
            self.updateUi()
        }
    }
    
    func updateUi() {
        
        if pokemon.type == "" {
            typeLbl.text = "none"
        } else{
            typeLbl.text = pokemon.type
        }
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            nextEvoImg.hidden = true
            evoLbl.text = "No Next Evolution"
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            var str = "Next Evolution: \(pokemon.nextEvolutionName)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                
                evoLbl.text = str
            }
        }
        descriptionLbl.text = pokemon.description
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
