//
//  SplashViewController.swift
//  RickAndMortyAcademy2024
//
//  Created by Pablo Maruottolo on 18/4/24.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var splashOpeningLabel: UILabel!
    
    var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSplash()
    }
    // MARK: - Functions
    func setUpSplash(){
        viewModel = SplashViewModel(router: SplashRouter(viewController: self))
        
        let delayInSeconds: TimeInterval = 2
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { [weak self] in
            self?.redirectToNextScreen()
        }
       
    }
    
    @objc func redirectToNextScreen() {
        viewModel.goToTabBar()
    }
}
