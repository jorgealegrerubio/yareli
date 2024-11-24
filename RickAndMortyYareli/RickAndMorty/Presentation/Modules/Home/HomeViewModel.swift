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
    var charactersUpDate: (() -> Void)?
    var currentPage = 1
    var nextPage: String?
    
    
    init(router: HomeRouter, characterUseCase: CharactersUseCaseProtocol) {
        self.router = router
        self.characterUseCase = characterUseCase
    }
    
    
    func getCharacters() {
        Task {
            do {
              let paginatedCharacters = try await characterUseCase.getPaginatedCharacters(page: currentPage)
                characters = paginatedCharacters.characters
                nextPage = paginatedCharacters.info.next
                
                charactersUpDate?()
            } catch {
                print("Error")
                //TODO
            }
        }
    }
    
    func addCharacters() {
        guard let page = nextPage else {
            return
        }
        
        currentPage += 1
        Task {
            do {
              let paginatedCharacters = try await characterUseCase.getPaginatedCharacters(page: currentPage)
                characters.append(contentsOf: paginatedCharacters.characters)
                nextPage = paginatedCharacters.info.next
                
                charactersUpDate?()
            } catch {
                print("Error")
                //TODO
            }
        }
    }
}
