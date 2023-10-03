//
//  ProfileImage.swift
//  Cool Destinations
//
//  Created by Bryan Ardon on 2/8/23.
//
import SwiftUI

struct ProfileImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.black, lineWidth: 2)
                    .shadow(color: .black, radius: 5)
            }
            .shadow(radius: 7)
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: Image("ProfilePicture"))
    }
}

