//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            VStack {
                Text(store.name).font(.subheadline)
            }
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
}
