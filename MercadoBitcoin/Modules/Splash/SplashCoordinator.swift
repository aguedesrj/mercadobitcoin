//
//  SplashCoordinator.swift
//  MercadoBitcoin
//
//

import UIKit

final class SplashCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)

        viewModel.onFinish = { [weak self] in
            guard let self = self else { return }
            self.parentCoordinator?.showExchangeListFlow()
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
