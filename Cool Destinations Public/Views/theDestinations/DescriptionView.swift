//
//  DescriptionView.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/8/23.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var modelData: ModelData
//    var country: Country
    var destination: Country.Destination
    
    
    var body: some View {
        ZStack (alignment: .center){
            Capsule()
                .fill(Color.gray)
                .frame(height: 250)
            Text(destination.descriptions)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding(5)
    }
}

struct DescriptionView_Previews: PreviewProvider {

    static var previews: some View {
        let modelData = ModelData()
        
        DescriptionView(destination: modelData.countries[0].destinations[0])
    }
}
