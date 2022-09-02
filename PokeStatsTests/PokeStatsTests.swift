//
//  PokeStatsTests.swift
//  PokeStatsTests
//
//  Created by Carolina Duartr on 25/08/2022.
//

import XCTest
@testable import PokeStats

class PokeStatsTests: XCTestCase {

    var apiUT: API!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        apiUT = API()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiUT = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPIPokemonReturn() {
        let pokemonNew = "mew"
        
        API.getPokemonInfo(urlArg: "https://pokeapi.co/api/v2/pokemon/mew", completion: { result in
            switch result {
                case let .success(currentPokemon):
                    let testPokemon = currentPokemon
                    XCTAssert(testPokemon.name == pokemonNew)
                
                case let .failure(error):
                    print("\(error)")
            }
        })
    }

}
