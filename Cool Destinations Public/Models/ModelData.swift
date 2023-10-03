//
//  ModelData.swift
//  Landmarks
//
//  Created by Nick Kasten on 1/15/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    //
    // the type is an array of Landmark structures (structures = weaker classes)
    @Published var countries: [Country] = load("holder.json")
    
    @Published var profile = Profile.default
//
//    // array of landmark objects in which isFeatured = true
//
//
//    // this makes a dictionary with String landmarks names as keys and "an array of associated landmarks" as values
//    var categories: [String: [Country]] {
//        Dictionary(
//            grouping: countries,
//            by: { $0.Region.RawValue}
//        )
//    }
}



/*  --inputs a String filename and outputs a Decodable T
    --guard is a Control Flow that must take an else statement
    --catch is used for exceptions in case of errors that arise from the do function
        (the dos follow the try function to attempt to accomplish their task, if not they throw an error up the stack to be caught by the catch function)
*/
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

