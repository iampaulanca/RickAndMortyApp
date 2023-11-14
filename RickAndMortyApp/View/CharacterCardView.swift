//
//  CharacterCardView.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import SwiftUI

struct CharacterCardView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    private var character: RickAndMortyCharacter
    
    init(homeViewModel: HomeViewModel, character: RickAndMortyCharacter) {
        self.homeViewModel = homeViewModel
        self.character = character
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            CustomImageView(imageURL: character.image, homeViewModel: homeViewModel)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                Text(
                    """
                    Name:
                    Gender:
                    Species:
                    Status:
                    Origin:
                    """
                )
                .font(.system(size: 16))
            }
            .frame(height: 100, alignment: .top)
            
            VStack {
                Text(
                    """
                    \(character.name)
                    \(character.gender)
                    \(character.species)
                    \(character.status)
                    \(character.origin.name)
                    """
                )
                .font(.system(size: 16))
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 100, alignment: .topLeading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(.blue, lineWidth: 2.0)
        }
    }
}

#Preview {
    CharacterCardView(homeViewModel: HomeViewModel(service: NetworkService()), character: rickSanchez)
}


let rickSanchez = RickAndMortyCharacter(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: ""), location: Location(name: "Citadel of Ricks", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: "", created: "")
