//
//  TechnicalException.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

public enum TechnicalException: Error, LocalizedError, Equatable {
    case technicalError
    case notConnectedToNetwork

    private static let infrastructureLocalizable = "InfrastructureLocalizable"
    
    public var errorDescription: String? {
        switch self {
        case .technicalError:
            return "technicalExceptionMessage".localized(tableName: TechnicalException.infrastructureLocalizable)
        case .notConnectedToNetwork:
            return "notConnectedToNetwork".localized(tableName: TechnicalException.infrastructureLocalizable)
        }
        
    }
}
