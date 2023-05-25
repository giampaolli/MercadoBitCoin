//
//  ExchangeListService.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

protocol ExchangeListServiceProtocol {
    func fetchExchanges(complition: @escaping LoadExchangeCompletion)
}

typealias LoadExchangeCompletion = (Result<[Exchange], NetworkError>) -> Void

class ExchangeListService: ExchangeListServiceProtocol {

    private let session: NetworkSessionProtocol

    init(session: NetworkSessionProtocol = NetworkSession()) {
        self.session = session
    }

    func fetchExchanges(complition: @escaping LoadExchangeCompletion) {
        let baseUrl = Enviroment.getValuesFromDict(key: .apiURL)
        let url = baseUrl + "v1/exchanges"

        let headers = NetworkSession.defaultHeader

        session.request(url,
                        method: .get,
                        parameters: nil,
                        headers: headers,
                        decodeTo: [Exchange].self,
                        completion: complition)
    }
}
