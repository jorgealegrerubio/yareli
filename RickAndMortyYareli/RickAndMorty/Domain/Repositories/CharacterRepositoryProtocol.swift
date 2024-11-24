//
//  CharacterRepositoryProtocol.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func getCharacters(page: Int) async throws -> [Character]
}
