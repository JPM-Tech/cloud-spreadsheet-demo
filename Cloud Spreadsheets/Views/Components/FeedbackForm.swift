import SwiftUI

struct FeedbackForm: View {
    let vm: ViewModel
    @State var firstName = ""
    @State var email = ""
    @State var feedback = ""
    @State var selectedRating = 0
    let numberOfChoices = 5
    
    var allFieldsAreCompleted: Bool {
        if !firstName.isBlank() && !email.isBlank() && selectedRating != 0 {
            return true
        }
        
        return false
    }
    
    var body: some View {
        Form {
            Section {
                TextField("First Name", text: $firstName)
                    .textContentType(.givenName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
            } header: {
                Text("Contact Info*")
            }
            
            Section {
                RatingView(rating: $selectedRating)
            } header: {
                Text("Rate this talk*")
            }
            
            Section {
                TextEditor(text: $feedback)
                    .frame(minHeight: 200)
            } header: {
                Text("Feedback is greatly appreciated")
            }
            
            Section {
                Button {
                    vm.sendFeedback(feedback: FeedbackFields(firstName: firstName, email: email.lowercased(), feedback: feedback, rating: selectedRating))
                } label: {
                    Text("Submit")
                }
                .disabled(!allFieldsAreCompleted)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    FeedbackForm(vm: ViewModel())
}
