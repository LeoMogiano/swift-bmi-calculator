//
//  Heroes.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 25/8/24.
//

import Foundation

// Estructura para capturar la respuesta completa del JSON
struct HeroResponse: Codable {
    let response: String
    let results: [Hero]?
}

struct Hero:Identifiable, Codable {
    let id: String
    let name: String
    let image: ImageHero
}

struct ImageHero: Codable {
    let url: String
}

