//
//  CustomImageView.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import SwiftUI


struct CustomImageView: View {
    @State var image: Image?
    private var imageURL: String
    private var homeViewModel: HomeViewModel
    init(imageURL: String, homeViewModel: HomeViewModel) {
        self.imageURL = imageURL
        self.homeViewModel = homeViewModel
    }

    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                if let uiImage = await homeViewModel.fetchImageFrom(urlString: imageURL) {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

#Preview {
    CustomImageView(imageURL: "",
                    homeViewModel: HomeViewModel(service: NetworkService()))
}
