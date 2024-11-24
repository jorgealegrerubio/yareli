//
//  SplashRouter.swift
//  RickAndMortyAcademy2024
//
//  Created by Pablo Maruottolo on 18/4/24.
//

import UIKit

class SplashRouter: SplashRouterProtocol {
    let viewController: SplashViewController
    
    init(viewController: SplashViewController) {
        self.viewController = viewController
    }
    
    func goToTabBar() {
        let tabBarViewController = HomeBuilder().build()
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = tabBarViewController
        sceneDelegate.window?.makeKeyAndVisible()
    }
}
