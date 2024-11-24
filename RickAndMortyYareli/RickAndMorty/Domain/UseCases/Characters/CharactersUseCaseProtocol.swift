//
//  CharactersUseCaseProtocol.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

protocol CharactersUseCaseProtocol {
    func getCharacters(page: Int) async throws -> [Character]
}
