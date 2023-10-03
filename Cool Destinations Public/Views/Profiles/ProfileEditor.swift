//
//  ProfileEditor.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 2/8/23.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.travelDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.travelDate)!
        return min...max
    }
    
    var body: some View {
        VStack {
            Text("Edit your profile here \(profile.name)!")
            List {
                HStack{
                    Text("Name").bold()
                    Divider()
                    TextField("Username", text: $profile.name)
                }
                DatePicker(selection: $profile.travelDate, in: dateRange, displayedComponents: .date) {
                    Text("Next date of Travel").bold()
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}

