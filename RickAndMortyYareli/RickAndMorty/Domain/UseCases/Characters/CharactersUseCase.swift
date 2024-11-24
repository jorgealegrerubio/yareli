//
//  CharactersUseCase.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

class CharactersUseCase: CharactersUseCaseProtocol {
    var repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPaginatedCharacters(page: Int) async throws -> PaginatedCharacters {
        try await repository.getPaginatedCharacters(page: page)
    }
}
