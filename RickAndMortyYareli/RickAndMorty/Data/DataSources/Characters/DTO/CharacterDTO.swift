//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let image: String
    let origin: OriginDTO

}

struct OriginDTO: Codable {
    let name: String
}
