//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 18/9/24.
//

import Foundation

final class HomeViewModel {
    let router: HomeRouter
    let characterUseCase: CharactersUseCaseProtocol
    var characters: [Character] = []
    var nextPageUrl: String? = "https://rickandmortyapi.com/api/character"
    var charactersUpDate: (() -> Void)?
    
    
    init(router: HomeRouter, characterUseCase: CharactersUseCaseProtocol) {
        self.router = router
        self.characterUseCase = characterUseCase
    }
    
    
    func getCharacters() {
        Task {
            do {
                characters = try await characterUseCase.getCharacters(page: 1)
                print(characters)
                charactersUpDate?()
            } catch {
                print("Error")
                //TODO
            }
        }
    }
}
