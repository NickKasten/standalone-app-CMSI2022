//
//  ProfileSummary.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/7/23.
//

import SwiftUI
struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text(profile.name)
                    .bold()
                    .font(.title)
                ProfileImage(image: Image("ProfilePicture"))
                Spacer()
                Text("Next anticipated travel date: ") + Text(profile.travelDate, style: .date)
                Divider()
                VStack(alignment: .leading) {
                    Text("Countries Visited")
                        .font(.headline)
                }
            }
        }
    }
}
struct ProfileSummary_Previews: PreviewProvider {
        static var previews: some View {
            ProfileSummary(profile: Profile.default)
                .environmentObject(ModelData())
        }
    }
