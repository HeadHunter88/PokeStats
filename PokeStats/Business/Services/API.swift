//
//  Network.swift
//  PokeStats
//
//  Created by Carolina Duartr on 25/08/2022.
//

import Foundation

class API{
    
    static let baseURL = DetailStrings.baseUrl.localized()
    
    private enum Endpoint {
        case pokedex
        
        var path: String {
            switch self {
                case .pokedex:
                return "\(DetailStrings.pokedexUrl.localized())\(DetailStrings.amountToSearchFor.localized())"
                }
        }
        var url: String {
            switch self {
                case .pokedex:
                    return "\(baseURL)\(path)"
                default:
                    return ":"
            }
        }
    }
    
    static func fetchPokedex(completion: @escaping (Result<[Pokemon],Error>) -> Void) {

        guard let url = URL(string: Endpoint.pokedex.url) else {
            //loadingIndicator.stopAnimating()
            print(CustomError.genericError)
            return
        }
        
        var newRequest = URLRequest(url: url)
        newRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: newRequest) { data, response, error in
            if let error = error {
                print(CustomError.connectionError)
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(CustomError.dataError))
                return
            }
            
            do {
                let pokedex = try JSONDecoder().decode(Pokedex.self, from: data)
                completion(.success(pokedex.results))
            } catch let err{
                print("\(err)")
                completion(.failure(CustomError.dataError))
            }
        }.resume()
    }
    
    //https://pokeapi.co/api/v2/pokemon/11/
    static func getPokemonInfo(urlArg: String, completion: @escaping (Result<PokemonInfo,Error>) -> Void) {
        
        guard let url = URL(string: urlArg) else {
            //loadingIndicator.stopAnimating()
            print(CustomError.genericError)
            return
        }
        
        var newRequest = URLRequest(url: url)
        newRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: newRequest) { data, response, error in
            if let error = error {
                print(CustomError.connectionError)
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(CustomError.dataError))
                return
            }
            
            do {
                let pokemonInfo = try JSONDecoder().decode(PokemonInfo.self, from: data)
                completion(.success(pokemonInfo))
            } catch let err{
                print("\(err)")
                completion(.failure(CustomError.dataError))
            }
        }.resume()
    }
    
    
        
}
