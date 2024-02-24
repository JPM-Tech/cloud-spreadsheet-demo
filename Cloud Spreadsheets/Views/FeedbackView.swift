import SwiftUI

struct FeedbackView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        Group {
            if let vmConfig = vm.config.first,
               let shouldShowFeedback = vmConfig.shouldAskForFeedback,
               shouldShowFeedback {
                FeedbackForm(vm: vm)
            } else {
                ContentUnavailableView("Feedback is currently unavailable ", systemImage: "exclamationmark.triangle.fill", description: Text("Try again after it has been enabled"))
            }
        }
        .task {
            await vm.fetchConfig()
        }
    }
}

#Preview {
    FeedbackView()
}
