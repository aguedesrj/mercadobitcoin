//
//  AppCoordinator.swift
//  MercadoBitcoin
//
//

import UIKit

// MARK: - Coordinator Protocol
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

// MARK: - AppCoordinator
final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let splashCoordinator = SplashCoordinator(window: window)
        splashCoordinator.parentCoordinator = self
        childCoordinators.append(splashCoordinator)
        splashCoordinator.start()
    }

    func showExchangeListFlow() {
        childCoordinators.removeAll { coordinator in
            coordinator is SplashCoordinator
        }

        let navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()

        let listCoordinator = ExchangeListCoordinator(navigationController: navController)
        listCoordinator.parentCoordinator = self
        childCoordinators.append(listCoordinator)
        listCoordinator.start()
    }

    func childDidFinish(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}
