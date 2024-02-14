//
//  FaqView.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/8/24.
//

import SwiftUI

struct FaqView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.faqs) { faq in
                VStack(alignment: .leading) {
                    Text(faq.question).bold()
                    Text(faq.answer)
                }
            }
            .refreshable {
                await vm.fetchFaqs()
            }
            .task {
                if vm.products.isEmpty {
                    await vm.fetchFaqs()
                }
            }
            .navigationTitle("FAQs")
        }
    }
}

#Preview {
    FaqView()
}
