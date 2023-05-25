//
//  ExchangeCoordinator.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 22/05/23.
//

import Foundation
import UIKit

protocol ExchangeCoordinatorDelegateProtocol: AnyObject {
    func showDetails(exchange: Exchange)
}

class ExchangeCoordinator: BaseCoordinator {

    override func start() {
        let viewModel = ExchangeListViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = ExchangeListViewController(viewModel: viewModel)

        navigation.viewControllers = [viewController]
        super.start()
    }

}

extension ExchangeCoordinator: ExchangeCoordinatorDelegateProtocol {

    func showDetails(exchange: Exchange) {
        let viewModel = ExchangeDetailsViewModel(exchange: exchange)
        let viewController = ExchangeDetailsViewController(viewModel: viewModel)

        navigation.pushViewController(viewController, animated: true)
    }

}
