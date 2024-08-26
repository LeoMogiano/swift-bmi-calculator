//
//  ListExample.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 24/8/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name:"Pokemon 1"),
    Pokemon(name:"Pokemon 2"),
    Pokemon(name:"Pokemon 3"),
    Pokemon(name:"Pokemon 4"),
    Pokemon(name:"Pokemon 5"),
    Pokemon(name:"Pokemon 6")
]

struct ListExample: View {
    var body: some View {
        List{
            ForEach(pokemons, id: \.name) { pokemon in
                Text(pokemon.name)
            }
        }
    }
}

struct Pokemon{
    let name:String
}

#Preview {
    ListExample()
}
