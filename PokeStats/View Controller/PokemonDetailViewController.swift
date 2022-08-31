//
//  PokemonDetailViewController.swift
//  PokeStats
//
//  Created by Carolina Duartr on 30/08/2022.
//

import Foundation
import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var infoTable: UITableView!
    
    let cellIndentifier = "cell"
    
    var pokemon: PokemonInfo
    
    
    init?(coder: NSCoder, pokemon: PokemonInfo) {
        self.pokemon = pokemon
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
    }
    
    func loadData(){
        
        self.infoTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        infoTable.delegate = self
        infoTable.dataSource = self
        
        KF.url(URL(string: getOfficialSprite()))
            .placeholder(UIImage(named: DetailStrings.placeholder.localized()))
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onSuccess{ result in }
            .onFailure{ result in }
            .set(to: pokemonImage)
    }
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.orderStart.localized()) \(self.pokemon.id) \(DetailStrings.orderEnd.localized())"
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            case 1:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.heightStart.localized()) \(self.pokemon.height) \(DetailStrings.heightEnd.localized())"
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            case 2:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.abilities.localized()) \(self.getAbilitiesString())"
                cell.textLabel!.numberOfLines = 0
                cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            case 3:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.heldItems.localized()) \(self.getHeldItems())"
                cell.textLabel!.numberOfLines = 0
                cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            case 4:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.species.localized()) \(self.pokemon.species.name)"
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            case 5:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                cell.textLabel!.text = "\(DetailStrings.moves.localized()) \(getMoves())"
                cell.textLabel!.numberOfLines = 0
                cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
                cell.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
                return cell
            default:
                let cell: UITableViewCell = self.infoTable.dequeueReusableCell(withIdentifier: cellIndentifier)! as UITableViewCell
                return cell
        }
    }
    
    func getOfficialSprite() -> String {
        let retString = "\(DetailStrings.frontSprite.localized())\(self.pokemon.id)\(DetailStrings.imgFormat.localized())"
        return retString
    }
    
    func getAbilitiesString() -> String {
        var retString = DetailStrings.none.localized()
        do{
            if self.pokemon.abilities != nil {
                retString = ""
                for case let abilityGroup? in self.pokemon.abilities{
                    retString += " \(abilityGroup.ability.name),"
                }
                return String(retString.dropLast())
            }
        } catch {
            return DetailStrings.none.localized()
        }
        return DetailStrings.none.localized()
    }
    func getHeldItems() -> String {
        var retString = DetailStrings.none.localized()
        do{
            if self.pokemon.heldItems != nil {
                retString = ""
                for case let heldItem? in self.pokemon.heldItems ?? [] {
                    retString += " \(heldItem.item.name),"
                }
                return String(retString.dropLast())
            }
        } catch {
            return DetailStrings.none.localized()
        }
        return DetailStrings.none.localized()
    }
    
    func getMoves() -> String {
        var retString = DetailStrings.none.localized()
        do{
            if self.pokemon.moves != nil {
                retString = ""
                for case let attack in self.pokemon.moves {
                    retString += " \(attack.move.name),"
                }
                return String(retString.dropLast())
            }
        } catch {
            return DetailStrings.none.localized()
        }
        return DetailStrings.none.localized()
    }
    
}
