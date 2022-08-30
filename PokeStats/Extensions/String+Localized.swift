//
//  String+Localized.swift
//  PokeStats
//
//  Created by Carolina Duartr on 30/08/2022.
//

import Foundation

extension String{
    func localized() -> String {
        var fileName = String()
        fileName = "DetailStrings"
        return NSLocalizedString(self, tableName: fileName, bundle: Bundle.main, value: String(), comment: String())
    }
}
