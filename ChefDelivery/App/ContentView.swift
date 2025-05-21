//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: -Atributos
    let homeService = HomeService()
    @State private var stores: [StoreType] = []
    
    @State private var isLoading = true
    
    //MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                        .padding()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: stores)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                await self.getStores()
            }
            getStoresWithAlamoFire()
        }
    }
    
    //MARK: Methods
    func getStores() async {
        do {
            let result = try await homeService.fetchDataNative()
            switch result {
                case .success(let stores):
                    self.stores = stores
                    self.isLoading = false
                case .failure(let error):
                self.isLoading = false
                print(error.localizedDescription)
            }
        } catch {
            self.isLoading = false
            print(error.localizedDescription)
        }
        
    }
    
    func getStoresWithAlamoFire() {
        homeService.fetchDataAlamo { stores, error in
            print(stores as Any)
        }
    }
    
}

#Preview {
    ContentView()
}
