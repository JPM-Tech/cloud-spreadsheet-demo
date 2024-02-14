//
//  ScheduleView.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/8/24.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.schedules) { schedule in
                HStack {
                    Text(schedule.talkDate.formatted(date: .omitted, time: .shortened))
                    Divider()
                    VStack(alignment: .leading) {
                        Text(schedule.title).bold()
                        Text(schedule.name)
                            .foregroundStyle(.secondary)
                    }
                }
                
            }
            .refreshable {
                await vm.fetchSchedules()
            }
            .task {
                if vm.products.isEmpty {
                    await vm.fetchSchedules()
                }
            }
            .navigationTitle("Talks: 2/28/2024")
        }
    }
}

#Preview {
    ScheduleView()
}
