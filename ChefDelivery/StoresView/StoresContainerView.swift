//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.headline)
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    StoreItemView(order: mock)
                }
            }
        }.padding(20)
    }
}

#Preview {
    StoresContainerView()
}
