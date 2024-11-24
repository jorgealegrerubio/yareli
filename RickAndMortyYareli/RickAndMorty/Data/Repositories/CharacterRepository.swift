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
    
    func getPaginatedCharacters(page: Int) async throws -> PaginatedCharacters {
        let paginatedCharactersDTO = try await remoteDataSource.getPaginatedCharacters(page: page)
        return paginatedCharactersDTO.toDomain()
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

fileprivate extension PaginatedCharactersDTO {
    func toDomain() -> PaginatedCharacters {
        PaginatedCharacters(characters: self.results.map { $0.toDomain() }, info: self.info.toDomain() )
    }
}

fileprivate extension InfoDTO {
    func toDomain() -> Info {
        Info(next: self.next)
    }
}
