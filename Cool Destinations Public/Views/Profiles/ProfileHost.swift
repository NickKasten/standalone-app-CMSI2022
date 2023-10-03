//
//  ProfileHost.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 2/7/23.
//
import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    if editMode?.wrappedValue == .active {
                        Button("Cancel", role: .cancel) {
                            draftProfile = modelData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    }
                    Spacer()
                    EditButton()
                }
                
                if editMode?.wrappedValue == .inactive {
                    ProfileSummary(profile: draftProfile)
                } else {
                    ProfileEditor(profile: $draftProfile)
                        .onAppear {
                            draftProfile = modelData.profile
                        }
                        .onDisappear {
                            modelData.profile = draftProfile
                        }
                }
//                ForEach(modelData.countries) { country in
//                    CountryBlock(country: country)
//                }
            }
            .padding()
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}

