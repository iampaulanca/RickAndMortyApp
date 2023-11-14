//
//  PageView.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import SwiftUI

struct PageView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Button(action: {
                homeViewModel.page -= 1
            }, label: {
                Image(systemName: "chevron.left")
            })
            .disabled(homeViewModel.page > homeViewModel.minPage ? false : true )
            
            Text("Page: \(homeViewModel.page)")
                .frame(alignment: .center)
                .padding()
            
            Button(action: {
                homeViewModel.page += 1
            }, label: {
                Image(systemName: "chevron.right")
            })
            .disabled(homeViewModel.page < homeViewModel.maxPage ? false : true )
            
            Spacer()
        }
    }
}


#Preview {
    PageView(homeViewModel: HomeViewModel(service: NetworkService()))
}
