//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    @State private var ratingFilter: Int = 0
    
    @State private var distance: Double = 50;
    
    var stores: [StoreType]
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter && store.distance <= distance
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                        Divider()
                    }
                    
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrelas")
                            }
                        }
                    }
                }.foregroundColor(.black)
                
                Menu("Distancia") {
                    
                    Button {
                        distance = 0
                    } label: {
                        Text("Limpar filtro")
                        Divider()
                    }
                    
                    ForEach(Array(stride(from: 5, to: 30, by: 5)), id: \.self) { distance in
                        Button {
                            self.distance = distance
                        } label: {
                            Text("Até \(distance.formatted()) km")
                        }
                    }
                }.foregroundColor(.black)
                
            }
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhuma loja encontrada.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
                
            }.foregroundColor(.black)
        }.padding(20)
    }
}

#Preview {
    StoresContainerView(stores: storesMock)
}
