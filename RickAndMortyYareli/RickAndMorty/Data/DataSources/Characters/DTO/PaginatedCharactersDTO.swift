//
//  PaginatedCharactersDTO.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

struct PaginatedCharactersDTO: Codable {
    let results: [CharacterDTO]
    let info: InfoDTO
}

struct InfoDTO: Codable {
    let next: String?
}
