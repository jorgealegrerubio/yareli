//
//  SplashViewModel.swift
//  RickAndMortyAcademy2024
//
//  Created by Pablo Maruottolo on 19/4/24.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol {
    let router: SplashRouterProtocol

    init(router: SplashRouterProtocol) {
        self.router = router
    }

    func goToTabBar() {
        router.goToTabBar()
    }
}
