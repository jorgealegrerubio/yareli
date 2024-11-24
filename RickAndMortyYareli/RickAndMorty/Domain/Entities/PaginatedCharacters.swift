//
//  PaginatedCharacters.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 24/11/24.
//

import Foundation

struct PaginatedCharacters {
    var characters: [Character]
    let info: Info
}

struct Info {
    let next: String?
}
