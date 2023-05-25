//
//  BaseCoordinator.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 22/05/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigation: UINavigationController { get set }

    func start()
}

class BaseCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigation: UINavigationController

    func start() {}

    init(_ navigation: UINavigationController, parent: Coordinator?) {
        self.parentCoordinator = parent
        self.navigation = navigation
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

}
