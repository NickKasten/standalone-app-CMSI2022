//
//  MapView.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/6/23.
//

import SwiftUI
import MapKit

struct MapView: View {
//    @EnvironmentObject var modelData: ModelData
//    var countries: [Country] {
//        modelData.countries
//    }
    
    var coordinate: CLLocationCoordinate2D

    var delta: MKCoordinateSpan

    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
//            annotationItems: countries,
//            annotationContent: { locations in
//                MapMarker(coordinate: coordinate
            .onAppear {
                setRegion(coordinate, delta)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D,_ delta: MKCoordinateSpan) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: delta
        )
    }
    
    
}

struct MapView_Previews: PreviewProvider {
//    let modelData = ModelData()
    
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 40.1431, longitude: 47.5769), delta: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7))
    }
}
