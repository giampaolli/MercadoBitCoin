//
//  LoadJSONMock.swift
//  MercadoBitcoinTests
//
//  Created by Felipe Giampaoli on 25/05/23.
//

import Foundation

enum JsonFileName: String {
    case exchangeListSucess = "exchangeList_sucess"
    case exchangeDetailsData = "exchangeDetails_data"
}

class LoadJSONMock<T> {
    func start<T: Decodable>(fileName: JsonFileName, ext: String = "json", inBundle bundle: Bundle = Bundle.main) -> T {
        let url = bundle.url(forResource: fileName.rawValue, withExtension: ext)!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()

        return try! decoder.decode(T.self, from: data)
    }
}
