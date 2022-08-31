//
//  Strings.swift
//  PokeStats
//
//  Created by Carolina Duartr on 30/08/2022.
//

import Foundation

enum DetailStrings: String {
    case orderStart = "orderStart"
    case orderEnd = "orderEnd"
    case heightStart = "heightStart"
    case heightEnd = "heightEnd"
    case abilities = "abilities"
    case heldItems = "heldItems"
    case species = "species"
    case moves = "moves"
    case none = "none"
    case artwork = "artwork"
    case imgFormat = "imgFormat"
    case frontSprite = "frontSprite"
    case placeholder = "placeholder"
    case baseUrl = "baseUrl"
    case pokedexUrl = "pokedexUrl"
    case amountToSearchFor = "amountToSearchFor"
    
    func localized() -> String { rawValue.localized() }
    
}
