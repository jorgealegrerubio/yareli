//
//  SplashBuilder.swift
//  RickAndMortyAcademy2024
//
//  Created by Pablo Maruottolo on 18/4/24.
//

import Foundation

class SplashBuilder {
    func build() -> SplashViewController? {
      let splashViewController = SplashViewController(nibName: "SplashViewController", bundle: nil)
        return splashViewController
    }
}

