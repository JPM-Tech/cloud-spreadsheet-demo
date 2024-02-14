//
//  ContentView.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductList()
                .tabItem { Label("Products", systemImage: "house") }
            
            ScheduleView()
                .tabItem { Label("Calendar", systemImage: "calendar") }
            
            FaqView()
                .tabItem { Label("FAQs", systemImage: "questionmark.app") }
            
            FeedbackView()
                .tabItem { Label("Feedback", systemImage: "text.bubble") }
        }
    }
}

#Preview {
    ContentView()
}
