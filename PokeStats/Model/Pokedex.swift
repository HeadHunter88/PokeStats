// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokedex = try? newJSONDecoder().decode(Pokedex.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.pokedexTask(with: url) { pokedex, response, error in
//     if let pokedex = pokedex {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Pokedex
class Pokedex: Codable {
    let count: Int
    let results: [Pokemon]
    
}

// MARK: - Result
class Pokemon: Codable {
    let name: String
    let url: String
    
}

// MARK: - Pokemon Info
class PokemonInfo: Codable {
    let abilities: [Abilities]
    let baseExperience: Int?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Float
    let heldItems: [HeldItem]?
    let id: Int
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Attack]
    let name: String?
    let order: Int?
    let pastTypes: [PastType]?
    let species: Species
    let sprites: Sprites
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
}

// MARK: - Ability
class Abilities: Codable {
    let ability: Ability
    let isHidden: Bool?
    let slot: Int?
}

// MARK: - Species
class Species: Codable {
    let name: String
    let url: String?
}

// MARK: - GameIndex
class GameIndex: Codable {
    let gameIndex: Int?
    let version: Species?
}

// MARK: - Move
class Attack: Codable {
    let move: MoveInfo
    let versionGroupDetails: [VersionGroupDetail]?
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: Species?
}

// MARK: - GenerationV
class GenerationV: Codable {
    let blackWhite: Sprites?
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
}

// MARK: - Versions
class Versions: Codable {
    let generationI: GenerationI?
    let generationIi: GenerationIi?
    let generationIii: GenerationIii?
    let generationIv: GenerationIv?
    let generationV: GenerationV?
    let generationVi: [String: Home]?
    let generationVii: GenerationVii?
    let generationViii: GenerationViii?
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?
}

// MARK: - GenerationI
class GenerationI: Codable {
    let redBlue, yellow: RedBlue?
}

// MARK: - RedBlue
class RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?
}

// MARK: - GenerationIi
class GenerationIi: Codable {
    let crystal: Crystal?
    let gold, silver: Gold?
}

// MARK: - Crystal
class Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
}

// MARK: - Gold
class Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?
}

// MARK: - GenerationIii
class GenerationIii: Codable {
    let emerald: Emerald?
    let fireredLeafgreen, rubySapphire: Gold?
}

// MARK: - Emerald
class Emerald: Codable {
    let frontDefault, frontShiny: String?
}

// MARK: - Home
class Home: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

// MARK: - GenerationVii
class GenerationVii: Codable {
    let icons: DreamWorld?
    let ultraSunUltraMoon: Home?
}

// MARK: - DreamWorld
class DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?
}

// MARK: - GenerationViii
class GenerationViii: Codable {
    let icons: DreamWorld?
}

// MARK: - Other
class Other: Codable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?
}

// MARK: - OfficialArtwork
class OfficialArtwork: Codable {
    let frontDefault: String?
}

// MARK: - Stat
class Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?
}

// MARK: - TypeElement
class TypeElement: Codable {
    let slot: Int?
    let type: Species?
}

// MARK: - HeldItem
class HeldItem: Codable {
    let item: HeldItemInfo
    let versionDetails: [VersionDetail]?
}

// MARK: - VersionDetail
class VersionDetail: Codable {
    let rarity: Int?
    let version: Species?
}

// MARK: - PastType
class PastType: Codable {
    let generation: Species?
    let types: [TypeElement]?
}

// MARK: - Ability
class Ability: Codable {
    let name: String
    let url: String
}

// MARK: - HeldItemInfo
class HeldItemInfo: Codable {
    let name: String
    let url: String?
}

// MARK: - MoveInfo
class MoveInfo: Codable {
    let name: String
    let url: String?
}
