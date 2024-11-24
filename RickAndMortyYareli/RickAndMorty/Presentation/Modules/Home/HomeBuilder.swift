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
        let dataSource = RemoteCharactersDataSources()
        let repository = CharacterRepository(remoteDataSource: dataSource)
        let useCase = CharactersUseCase(repository: repository)
        let viewModel = HomeViewModel(router: router, characterUseCase: useCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
