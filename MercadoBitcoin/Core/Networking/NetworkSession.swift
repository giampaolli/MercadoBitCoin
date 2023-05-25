//
//  NetworkSession.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation
import Alamofire

enum NetworkError: String, Error {
    case noConnection = "No Internet connection, please try again!!!"
    case generic = "Generic error, please try again!!!"
}

protocol NetworkSessionProtocol {
    func request<T: Decodable> (
        _ url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        decodeTo: T.Type,
        completion: @escaping (Swift.Result<T, NetworkError>) -> Void
    )
}

class NetworkSession: NetworkSessionProtocol {

    static var defaultHeader: HTTPHeaders {
        var headers = HTTPHeaders()

        let apiKey = Enviroment.getValuesFromDict(key: .apiKey)
        let apiKeyHeader = HTTPHeader(name: "X-CoinAPI-Key", value: apiKey)
        headers.add(apiKeyHeader)

        return headers
    }

    func request<T: Decodable> (
        _ url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        decodeTo: T.Type,
        completion: @escaping (Swift.Result<T, NetworkError>) -> Void
    ) {
        Session.default
            .request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: T.self)  { (response) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(.failure(.generic))
                case .success(let result):
                    completion(.success(result))
                }
            }
    }
}
