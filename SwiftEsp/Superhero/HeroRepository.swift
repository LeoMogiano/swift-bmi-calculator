//
//  File.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 25/8/24.
//

import Foundation

class HeroRepository {
    
    let _baseURL = "https://superheroapi.com/api/bde2411c00dcf113b6342a5603f5ce65"
    
    
    func getHeroes(query: String) async throws -> [Hero] {
        let apiURL = "\(_baseURL)/search/\(query)"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: apiURL)!)
            let heroResponse = try JSONDecoder().decode(HeroResponse.self, from: data)
            if heroResponse.response == "error" { return [] }
            return heroResponse.results!
           
           
        } catch {
            print("Error fetching heroes: \(error)")
            throw error
        }
    }

}
