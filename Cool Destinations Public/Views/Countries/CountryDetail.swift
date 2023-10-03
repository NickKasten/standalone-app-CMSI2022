//
//  CountryDetail.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/6/23.
//

import SwiftUI
import MapKit

/// THIS IS GOING TO HOUSE OUR COOL DESTINATIONS AND MORE

struct CountryDetail: View {
    @EnvironmentObject var modelData: ModelData
    var country: Country
    var countryIndex: Int {
        modelData.countries.firstIndex(where: { $0.id == country.id})!
    }
    var body: some View {
        ScrollView {
            VStack (alignment: .center){
                HStack {
                    Text(country.Country)
                        .font(.system(size: 30, weight: .light, design: .serif))
                        .padding(7)
                        .overlay {
                            Rectangle().stroke(.white, lineWidth: 5)
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                    // isSet T F
                    VisitedButton(isSet: $modelData.countries[countryIndex].visited)
                            .padding()
                }
                
                MapView(coordinate: country.locationCoordinate, delta: country.locationDeltas)
                    .ignoresSafeArea(edges: .bottom)
                    .frame(height: 350)
                    .shadow(radius: 10)
                    .cornerRadius(15)
                
// TODO: Make the Destination blocks for this

                ForEach(country.destinations) { destination in
                    DestinationBlock(country: country, destination: destination)
                        .cornerRadius(2.5)
                    .padding(EdgeInsets(top:0.1, leading: 5, bottom: 0.1, trailing: 5))
                }
                
            }
        }
        .background(Color.green)
    }
}

struct CountryDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CountryDetail(country: modelData.countries[1])
            .environmentObject(modelData)
    }
}
