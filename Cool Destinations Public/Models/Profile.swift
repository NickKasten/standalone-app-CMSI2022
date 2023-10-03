//
//  Profile.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/7/23.
//

import Foundation

struct Profile {
    var name: String
    var travelDate = Date()
    static let `default` = Profile(name: "Mike")
        
}
