//
//  ProductList.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/6/24.
//

import SwiftUI

struct ProductList: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if let config = vm.config.first,
                   config.productLayout == "list" {
                    List(vm.products, id: \.name) { product in
                        ProductView(product: product)
                    }
                    .refreshable {
                        await vm.fetchProducts()
                    }
                } else {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.flexible(), alignment: .top)]) {
                            ForEach(vm.products, id: \.name) { product in
                                ProductView(product: product).frame(width: 200).padding()
                            }
                        }
                    }
                }
            }
            .task {
                if vm.products.isEmpty {
//                    await vm.fetchProducts()
                }
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ProductList()
}
