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
struct Pokedex: Codable {
    let count: Int
    let results: [Pokemon]
    
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
    
}

// MARK: - Pokemon Info
struct PokemonInfo: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Int?
    let heldItems: [HeldItem]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let pastTypes: [PastType]?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int?
    let version: Species?
}

// MARK: - Move
struct Move: Codable {
    let move: Species?
    let versionGroupDetails: [VersionGroupDetail]?
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: Species?
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites?
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
}

// MARK: - Versions
struct Versions: Codable {
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
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue?
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal?
    let gold, silver: Gold?
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
}

// MARK: - Gold
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: Emerald?
    let fireredLeafgreen, rubySapphire: Gold?
}

// MARK: - Emerald
struct Emerald: Codable {
    let frontDefault, frontShiny: String?
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld?
    let ultraSunUltraMoon: Home?
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld?
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String?
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}

// MARK: - HeldItem
struct HeldItem: Codable {
    let item: Species?
    let versionDetails: [VersionDetail]?
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    let rarity: Int?
    let version: Species?
}

// MARK: - PastType
struct PastType: Codable {
    let generation: Species?
    let types: [TypeElement]?
}