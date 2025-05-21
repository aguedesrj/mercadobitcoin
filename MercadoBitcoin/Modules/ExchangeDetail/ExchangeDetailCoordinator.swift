//
//  ExchangeDetailCoordinator.swift
//  MercadoBitcoin
//
//

import UIKit

final class ExchangeDetailCoordinator: Coordinator {
    weak var parentCoordinator: AnyObject?
    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    private let exchange: Exchange

    init(navigationController: UINavigationController, exchange: Exchange) {
        self.navigationController = navigationController
        self.exchange = exchange
    }

    func start() {
        let viewModel = ExchangeDetailViewModel()
        let viewController = ExchangeDetailViewController(exchange: exchange, viewModel: viewModel)

        viewController.onDismiss = { [weak self] in
            guard let self = self else { return }
            if let parent = self.parentCoordinator as? ExchangeListCoordinator {
                parent.childDidFinish(self)
            }
        }

        navigationController.pushViewController(viewController, animated: true)
    }
}
