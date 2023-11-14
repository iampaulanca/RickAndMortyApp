//
//  HomeView.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/12/23.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel(service: NetworkService())
    var body: some View {
        NavigationStack {
            VStack {
                PageView(homeViewModel: homeViewModel)
                ScrollViewReader { proxy in
                    List(homeViewModel.rickAndMortyCharacters ?? []) { character in
                        CharacterCardView(homeViewModel: homeViewModel, character: character)
                            .id(character.id)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .onChange(of: homeViewModel.page) { _, _ in
                        proxy.scrollTo(homeViewModel.topID)
                    }
                }
            }
            .alert("Error", isPresented: $homeViewModel.errorShow,
                   actions: {},
                   message: {
                Text("\(homeViewModel.errorString)")
            })
        }
    }
}

#Preview {
    HomeView()
}

