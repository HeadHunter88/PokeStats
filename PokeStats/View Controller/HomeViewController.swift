//
//  HomeViewController.swift
//  PokeStats
//
//  Created by Carolina Duartr on 29/08/2022.
//

import Foundation
import UIKit
import Kingfisher


class HomeViewController: UIViewController {
        
    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var refreshPokemonButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var pokedex: [Pokemon] = []
    
    init?(coder: NSCoder, pokedex: [Pokemon]) {
        self.pokedex = pokedex
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("Use `init(coder:image:)` to initialize an `HomeViewController` instance.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRandomPokemon()
        
        //API.getPokemonInfo(urlArg: url, completion: { result in
        //    DispatchQueue.main.async { [weak self] in
        //        switch result {
        //            case let .success(currentPokemon):
                    
        //            case let .failure(error):
        //                print("\(error)")
        //        }
        //    }
        //})
    }
    
    @IBAction func refreshPokemon(_ sender: Any) {
        loadRandomPokemon()
    }
    
    //Original Sprite - "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(randomItemIdx).png"
    //Original Artwork - "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(randomItemIdx).png"
    func loadRandomPokemon() {
        let randomItemIdx = pokedex.indices.randomElement()!
        let pokemonName: String = pokedex[randomItemIdx].name
        
        namePokemonLabel.text = pokemonName.capitalizeFirstLetter()
        
        let urlImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(randomItemIdx+1).png"
        KF.url(URL(string: urlImg))
            .placeholder(UIImage(named: "WhoIsPlaceholder.png"))
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onSuccess{ result in }
            .onFailure{ result in }
            .set(to: mainImageView)
    }
}

extension String {
    func capitalizeFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitFirstLetter() {
      self = self.capitalizeFirstLetter()
    }
}
