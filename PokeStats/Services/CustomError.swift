//
//  CustomError.swift
//  PokeStats
//
//  Created by Carolina Duartr on 26/08/2022.
//

import Foundation

enum CustomError{
    case connectionError, dataError, genericError
}

extension CustomError: LocalizedError{
    public var errorDescription: String?{
        switch self {
            case .connectionError: return "conenction message"
            case .dataError: return "data message"
            case .genericError: return "generic message"
            default: return "unexpected error"
        }
    }
}
