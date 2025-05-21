//
//  ExchangeListCoordinator.swift
//  MercadoBitcoin
//
//

import UIKit

final class ExchangeListCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    private let service: ExchangeService

    // prefiro manter a API key em variáveis de ambiente no CI/CD e injetar no build de forma segura.
    init(navigationController: UINavigationController,
         service: ExchangeService = ExchangeServiceImpl(apiKey: "3dbf1186-1efa-4887-b84d-e163125f8d52")) {
        self.navigationController = navigationController
        self.service = service
    }

    func start() {
        let viewModel: ExchangeListViewModelProtocol = ExchangeListViewModel(service: service)
        let viewController = ExchangeListViewController(viewModel: viewModel)

        viewModel.onSelectExchange = { [weak self] exchange in
            self?.showDetail(exchange)
        }

        navigationController.pushViewController(viewController, animated: true)
    }

    private func showDetail(_ exchange: Exchange) {
        let detailCoordinator = ExchangeDetailCoordinator(
            navigationController: navigationController,
            exchange: exchange
        )
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }

    func childDidFinish(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}
