//
//  HomeScreen.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 1/31/23.
//

//NOTE: Can't click on map!!
import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var modelData: ModelData
    
    var countries: [Country] {
        modelData.countries
    }
       @State private var searchText = ""

       var body: some View {
           NavigationStack {
               List {
                   ForEach(searchResults, id: \.self) { country in
                       HStack{
                        NavigationLink {
                               CountryDetail(country: country)
                           }
                       label: {
                               CountryBlock(country: country)
                           }
                       }
                   }
               }
               .navigationTitle("Cool Destinations")
           }
           .searchable(text: $searchText)
       }

       var searchResults: [Country] {
           if searchText.isEmpty {
               return countries
           } else {
               return countries.filter { $0.Country.contains(searchText) }
           }
       }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(ModelData())
    }
}
