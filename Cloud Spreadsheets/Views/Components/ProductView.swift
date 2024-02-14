//
//  ProductView.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/2/24.
//

import SwiftUI

struct ProductView: View {
    let product: ProductFields
    
    var body: some View {
        VStack {
            if let imageLink = product.imageLink {
                AsyncImage(url: imageLink) { imagePhase in
                    switch imagePhase {
                    case .empty:
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                    case .success(let returnedImage):
                        returnedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                    case .failure:
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .font(.headline)
                            .foregroundColor(.red)
                    @unknown default:
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                    
            }
            
            Text(product.name).font(.title2)
            Text(product.description).font(.caption).foregroundStyle(.secondary)
            
            Text(product.price, format: .currency(code: "USD")).foregroundStyle((product.inStock ?? false) ? .green : .secondary)
            
            if !(product.inStock ?? false) {
                Text("Out of Stock")
                    .bold()
                    .foregroundStyle(.red)
            } else {
                Text(" ")
            }
        }
    }
}

#Preview {
    ProductView(product: ProductFields(name: "Test Name", description: "Test Desc", price: 123.45, image: nil, inStock: true))
}
