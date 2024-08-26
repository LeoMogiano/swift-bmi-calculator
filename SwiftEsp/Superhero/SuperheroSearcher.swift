//
//  SuperheroSearcher.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 24/8/24.
//

import SwiftUI

struct SuperheroSearcher: View {
    @State private var searcherText = ""
    @State private var heroes: [Hero]? = nil
    var body: some View {
        VStack {
            TextField("", text: $searcherText, prompt: Text("Buscador").foregroundStyle(.white.opacity(0.5)))
                .foregroundStyle(.white)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 0.8)
                 )
                .tint(.white)
                .padding(.horizontal, 20)
                .autocorrectionDisabled()
                .onSubmit {
                    Task{
                        heroes = try await HeroRepository().getHeroes(query: searcherText)
                    }
                }
            
            if(heroes != nil) {
                if (!heroes!.isEmpty) {
                    List(heroes!) { hero in
                        Text(hero.name)
                            .listRowBackground(Color.gray.opacity(0.2))
                            .foregroundStyle(.white)
                    }
                    .scrollContentBackground(.hidden)
                    
                } else {
                    Text("No heroes available")
                        .foregroundStyle(.red)
                        .padding()
                }
            }
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}


#Preview {
    SuperheroSearcher()
}

