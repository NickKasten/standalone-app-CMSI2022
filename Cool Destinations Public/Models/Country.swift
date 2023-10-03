//
//  Country.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 1/31/23.
//

import SwiftUI
import MapKit

import Foundation
struct Country: Hashable, Codable, Identifiable {
    var id: Int
    var visited: Bool
    var Country: String
    var Region: RegionEnum
    
    // enumeration for the Regions so that when all countries are loaded can display them in their respective groups in a tab
    enum RegionEnum: String, CaseIterable, Codable {
        case asiaExcludingNearEast = "ASIA (EX. NEAR EAST)         "
        case easternEurope = "EASTERN EUROPE                     "
        case northernAfrica = "NORTHERN AFRICA                    "
        case oceania = "OCEANIA                            "
        case westernEurope = "WESTERN EUROPE                     "
        case subSaharanAfrica = "SUB-SAHARAN AFRICA                 "
        case latinAmerAndCarib = "LATIN AMER. & CARIB    "
        case cwIndStates = "C.W. OF IND. STATES "
        case nearEast = "NEAR EAST                          "
        case northernAmerica = "NORTHERN AMERICA                   "
    }
    
    var Population: Int
    var Climate: String
    
    //coords
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    
    // Deltas attribute
        
    private var deltas: Deltas
    var locationDeltas: MKCoordinateSpan {
            MKCoordinateSpan(
                latitudeDelta: deltas.latitudeDelta,
                longitudeDelta: deltas.longitudeDelta)
    }       
    struct Deltas: Hashable, Codable{
        var latitudeDelta: Double
        var longitudeDelta: Double
    }
    
// TODO: Destinations substructure
    var destinations: [Destination]

    struct Destination: Hashable, Codable, Identifiable{
        var id: Int
        var name: String
        var descriptions: String
        // TODO: attribute for the deltas of the destination
//        private var deltas: Deltas
//            var locationDeltas: MKCoordinateSpan {
//        MKCoordinateSpan(
//            latitudeDelta: deltas.latitudeDelta,
//            longitudeDelta: deltas.longitudeDelta)
//        }
//
        private var coordinates: Coordinates
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
        
        
    }
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}


