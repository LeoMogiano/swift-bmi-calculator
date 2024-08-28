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
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer().frame(height: 25)
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
                            isLoading = true
                            heroes = try await HeroRepository().getHeroes(query: searcherText)
                            isLoading = false
                        }
                    }
                
                if isLoading {
                    Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding()
                        
                } else if let heroes = heroes {
                    if !heroes.isEmpty {
                        List(heroes) { hero in
                            SuperHeroItem(superhero: hero)
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    VStack {
                        Text("SuperHero")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                    }.padding(.top, 20)
                }
            }
            .navigationBarBackButtonHidden()
            .foregroundStyle(.white)
        
        }
    }
}

struct SuperHeroItem:View {
    let superhero: Hero
    var body: some View {
        Text(superhero.name)
            .listRowBackground(Color.gray.opacity(0.2))
            .foregroundStyle(.white)
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}


#Preview {
    SuperheroSearcher()
}

