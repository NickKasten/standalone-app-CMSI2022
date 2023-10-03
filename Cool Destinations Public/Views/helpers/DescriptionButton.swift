//
//  DescriptionButton.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 2/8/23.
//
import SwiftUI

struct DescriptionButton: View {
    @State var isDescribed: Bool
    var body: some View {
        Button {
            isDescribed.toggle()
        } label: {
            Label("Toggle Description", systemImage: isDescribed ? "square.and.pencil" : "square.and.pencil")
                . labelStyle(.iconOnly)
                .foregroundColor(isDescribed ? .green : .gray)
        }
    }
}

struct DescriptionButton_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionButton(isDescribed: false)
    }
}
