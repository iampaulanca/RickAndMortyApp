//
//  HomeViewModel.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/12/23.
//

import Foundation
import Combine
import UIKit

class HomeViewModel: ObservableObject {
    private var service: NetworkServiceRequests
    private var cancellables = Set<AnyCancellable>()
    @Published var rickAndMortyCharacters: [RickAndMortyCharacter]? = nil
    @Published var errorString: String = ""
    @Published var errorShow: Bool = false
    @Published var page: Int = 1
    @Published var topID: Int = 1
    var minPage: Int = 1
    var maxPage: Int = 42
    
    init(service: NetworkServiceRequests) {
        self.service = service
        self.subscribers()
    }
    
    @MainActor
    func fetchCharacters() async {
        do {
            self.rickAndMortyCharacters = try await service.fetchCharacters(page: self.page)
            self.topID = self.rickAndMortyCharacters?.first?.id ?? 1
        } catch {
            errorHandling(error: error)
        }
    }
    
    func fetchImageFrom(urlString: String) async -> UIImage? {
        do {
            return try await service.fetchImageFrom(urlString: urlString)
        } catch {
            errorHandling(error: error)
            return nil
        }
    }
    
    private func errorHandling(error: Error) {
        errorShow = true
        errorString = error.localizedDescription
    }
    
    private func subscribers() {
        $page.sink { page in
            Task {
                await self.fetchCharacters()
            }
        }.store(in: &cancellables)
    }
}
