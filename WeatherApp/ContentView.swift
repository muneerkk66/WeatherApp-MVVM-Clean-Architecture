//
//  ContentView.swift
//  WeatherApp
//
//  Created by Muneer K K on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.pink
            HomeView()
        }.accentColor(Color.black)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
