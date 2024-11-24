//
//  Character.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let image: String
    let origin: Origin

}

struct Origin: Codable{
    let name: String
}

struct Results: Codable {
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
}
