//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
