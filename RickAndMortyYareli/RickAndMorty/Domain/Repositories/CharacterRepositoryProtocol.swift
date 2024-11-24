//
//  CharacterRepositoryProtocol.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func getPaginatedCharacters(page: Int) async throws -> PaginatedCharacters
}
