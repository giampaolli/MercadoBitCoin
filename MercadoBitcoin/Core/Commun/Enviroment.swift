//
//  Enviroment.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

public enum InfoPlistKeys: String {
    case apiKey = "API_KEY"
    case apiURL = "API_URL"
}

public enum Enviroment {

    case apiKey
    case apiURL

    private static func dictFromPlist() -> [String: Any] {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            return [:]
        }
        return NSDictionary(contentsOfFile: path) as? [String: Any] ?? [:]
    }

    public static func getValuesFromDict(key: InfoPlistKeys) -> String {
        let dict = dictFromPlist()
        switch key {
        case .apiKey:
            return dict[InfoPlistKeys.apiKey.rawValue] as? String ?? ""
        case .apiURL:
            return dict[InfoPlistKeys.apiURL.rawValue] as? String ?? ""
        }
    }
}
