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
    
    init(imageURL: String) {
        self.imageURL = imageURL
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
                do {
                    if let uiImage = try await NetworkService().fetchImageFrom(urlString: imageURL) {
                        self.image = Image(uiImage: uiImage)
                    }
                } catch {
                    self.image = Image(systemName: "wifi.slash")
                }
            }
        }
    }
}

#Preview {
    CustomImageView(imageURL: "")
}
