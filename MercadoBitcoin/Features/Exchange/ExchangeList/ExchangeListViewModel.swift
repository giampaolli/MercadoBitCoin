//
//  ExchangeListViewModel.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

protocol ExchangeListViewModelProtocol: AnyObject {
    var exchangeList: [Exchange] { get }
    var filterExchangeList: [Exchange] { get }
    var isFilterMode: Bool { get }
    var delegate: ExchangeListViewControllerDelegate? { get set }
    var coordinatorDelegate: ExchangeCoordinatorDelegateProtocol? { get set }
    func loadExchanges()
    func showDetails(exchange: Exchange)
    func filterExchange(_ query: String)
}

class ExchangeListViewModel: ExchangeListViewModelProtocol {

    var exchangeList: [Exchange] = []

    var filterExchangeList: [Exchange] = []

    var isFilterMode: Bool = false

    weak var delegate: ExchangeListViewControllerDelegate?

    var coordinatorDelegate: ExchangeCoordinatorDelegateProtocol?

    private var service: ExchangeListServiceProtocol

    init(service: ExchangeListServiceProtocol = ExchangeListService()) {
        self.service = service
    }

    func loadExchanges() {
        delegate?.startLoading()
        service.fetchExchanges {[weak self] result in
            guard let self = self else { return }
            self.delegate?.stopLoading()
            switch result {
            case .success(let exchangeList):
                self.exchangeList = exchangeList
                self.delegate?.reloadTableView()
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }

    func showDetails(exchange: Exchange) {
        coordinatorDelegate?.showDetails(exchange: exchange)
    }

    func filterExchange(_ query: String) {
        isFilterMode = query.count > 0
        delegate?.startLoading()
        filterExchangeList = exchangeList.filter({ exchange in
            if let name = exchange.name {
                return name.hasPrefix(query)
            }
            return false
        })
        
        delegate?.startLoading()
        delegate?.reloadTableView()
    }

}
