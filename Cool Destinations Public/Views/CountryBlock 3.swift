//
//  CountryBlock.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/6/23.
//

import SwiftUI

//structures are weaker classes :)

struct CountryBlock: View {
    
    // we defined type Landmark in the Landmark file that constructs via the JSON file's data
    var country: Country
    
    // it generates as this view with a horizontal stack
    var body: some View {
        ZStack {
            Color.init(red: 153, green: 204, blue: 255)
                .ignoresSafeArea()
            
            HStack {
                country.image
                    .resizable()
                    .frame(width: 75, height: 50)
                Text(country.Country)
                    .bold()
                
                Spacer()
                
    //            if country.isFavorite {
    //                Image(systemName: "star.fill")
    //                    .foregroundColor(.yellow)
    //            }
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    // pulling the landmarks from the ModelData class
    static var countries = ModelData().countries
    
    static var previews: some View {
        Group {
            CountryBlock(country: countries[0])
//            CountryBlock(country: countries[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
