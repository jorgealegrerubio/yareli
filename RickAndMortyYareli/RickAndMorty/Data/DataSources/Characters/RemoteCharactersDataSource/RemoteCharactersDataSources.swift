//
//  RemoteCharactersDataSources.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 23/10/24.
//

import Foundation

class RemoteCharactersDataSources: RemoteCharactersDataSourceProtocol {
    func getPaginatedCharacters(page: Int) async throws -> PaginatedCharactersDTO {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)") else { return PaginatedCharactersDTO(results: [], info: InfoDTO(next: nil)) }
                let request = URLRequest(url: url)
                let (data, _) = try await URLSession.shared.data(for: request)
                let decodeCharacters = try JSONDecoder().decode(PaginatedCharactersDTO.self, from: data)
                return decodeCharacters
    }
    
    
}
