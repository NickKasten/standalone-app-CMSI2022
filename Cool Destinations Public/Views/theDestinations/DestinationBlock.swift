//
//  DestinationBlock.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 2/8/23.
//

import SwiftUI


struct DestinationBlock: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isDescribed = false

    var country: Country
    // used to grab each of the destinations and load their indiv descriptions
    var destination: Country.Destination
    
    var body: some View {
        VStack {
                ZStack {
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 65)
                    HStack {
                        Text(destination.name)
                            .font(.system(size: 15, weight: .light, design: .serif))
                        .padding(5)
                        Button {
                            isDescribed.toggle()
                        } label: {
                            Label("Toggle Description", systemImage: isDescribed ? "square.and.pencil" : "square.and.pencil")
                                . labelStyle(.iconOnly)
                                .foregroundColor(isDescribed ? .orange : .gray)
                                .imageScale(.large)
                                .scaleEffect(isDescribed ? 1.5 : 1)
                                .rotationEffect(.degrees(isDescribed ? 360 : 0))
                        }
                        .padding(.leading)
                    }
                }
                if (isDescribed) {
                    // replace text with the description views
                    DescriptionView(destination: destination)
                        .transition(.slide)
//                        .padding()
                }

            
        }
    }
}


struct DestinationBlock_Previews: PreviewProvider {
    // pulling the landmarks from the ModelData class
    static var countries = ModelData().countries
    
    static var previews: some View {
        DestinationBlock(country: countries[0], destination: countries[0].destinations[0])
            .environmentObject(ModelData())
    }
}
