//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

class CharacterRepository: CharacterRepositoryProtocol {
    var remoteDataSource: RemoteCharactersDataSourceProtocol
    
    init(remoteDataSource: RemoteCharactersDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCharacters(page: Int) async throws -> [Character] {
        let charactersDTO = try await remoteDataSource.getCharacters(page: page)
        return charactersDTO.map { $0.toDomain() }
    }
}

fileprivate extension CharacterDTO {
    func toDomain() -> Character {
        Character(id: self.id, name: self.name, image: self.image, origin: self.origin.toDomain())
    }
}

fileprivate extension OriginDTO {
    func toDomain() -> Origin {
        Origin(name: self.name)
    }
}
