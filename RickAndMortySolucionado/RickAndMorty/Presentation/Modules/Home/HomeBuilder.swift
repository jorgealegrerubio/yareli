//
//  HomeBuilder.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 18/9/24.
//

import Foundation

class HomeBuilder {
    func build() -> HomeViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let router = HomeRouter(viewController: viewController)
        let viewModel = HomeViewModel(router: router)
        viewController.viewModel = viewModel
        return viewController
    }
}
