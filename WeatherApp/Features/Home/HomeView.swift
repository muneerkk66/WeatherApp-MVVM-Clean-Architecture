//
//  HomeView.swift
//  WeatherApp
//
//  Created by Muneer K K on 12/01/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            Form {
                searchField
                if let data = viewModel.dataSource {
                    Text(data.temperature).frame(maxWidth: .infinity, maxHeight: .infinity).font(.system(size: 40))
                }
            }.navigationTitle(L10n.appTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField(L10n.citField, text: $viewModel.city)
        }
    }
}
