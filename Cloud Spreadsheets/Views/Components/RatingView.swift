//
//  RatingView.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/9/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maximumRating = 5
    let offImage = Image(systemName: "star")
    let onImage = Image(systemName: "star.fill")
    let offColor = Color.blue
    let onColor = Color.blue
    
    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        // Adding the plain button style here allows this component to work as expected when wrapped in a Form component.
        // This is because a Form makes the whole row clickable, and the Form will try to be helpful by clicking every button in the row.
        // This is not the desired behavior we would like, so we are adding the style modifier here that tells the form to only click the selected button
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        }
        
        return onImage
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
