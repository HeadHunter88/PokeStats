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
    var currentPokemonIdx: Int?
    var currentPokemon: PokemonInfo?
    
    init?(coder: NSCoder, pokedex: [Pokemon]) {
        self.pokedex = pokedex
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
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
    
    func loadRandomPokemon() {
        currentPokemonIdx = pokedex.indices.randomElement()!
        let pokemonName: String = pokedex[currentPokemonIdx!].name
        
        namePokemonLabel.text = pokemonName.capitalizeFirstLetter()
        
        KF.url(URL(string: getOfficialArtwork()))
            .placeholder(UIImage(named: DetailStrings.placeholder.localized()))
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onSuccess{ result in
                let imageTap = UITapGestureRecognizer(target: self, action: #selector(self.ShowPokemonDetail))
                self.mainImageView.isUserInteractionEnabled = true
                self.mainImageView.addGestureRecognizer(imageTap)
            }
            .onFailure{ result in }
            .set(to: mainImageView)
        
        API.getPokemonInfo(urlArg: pokedex[currentPokemonIdx!].url, completion: { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                    case let .success(currentPokemon):
                        self?.currentPokemon = currentPokemon
                    
                    case let .failure(error):
                        print("\(error)")
                }
            }
        })
        
    }
    
    @objc func ShowPokemonDetail(pokemonIdx: Int){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "DetailView", creator: { coder -> PokemonDetailViewController? in
            PokemonDetailViewController(coder: coder, pokemon: self.currentPokemon!)
        })
        //viewController
        self.present(viewController, animated: true)
    
    }
    
    func getOfficialArtwork() -> String {
        let retString = "\(DetailStrings.artwork.localized())\(currentPokemonIdx!+1)\(DetailStrings.imgFormat.localized())"
        return retString
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
