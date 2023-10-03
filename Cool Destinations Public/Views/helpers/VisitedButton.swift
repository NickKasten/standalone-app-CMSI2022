//
//  VisitedButton.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 2/8/23.
//
import SwiftUI

struct VisitedButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Visited", systemImage: isSet ? "map.fill" : "map")
                . labelStyle(.iconOnly)
                .foregroundColor(isSet ? .blue : .gray)
        }
    
    }
}

struct VisitedButton_Previews: PreviewProvider {
    static var previews: some View {
        VisitedButton(isSet: .constant(false))
    }
}

