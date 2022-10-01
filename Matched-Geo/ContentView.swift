//
//  ContentView.swift
//  Matched-Geo
//
//  Created by Sean Allen on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isProfileExpanded = false
    @Namespace private var profileAnimation
    @Namespace private var profileAvatar
    @Namespace private var profileName
    @Namespace private var profileJob
    
    var body: some View {
        VStack {
            if isProfileExpanded {
                expandedProfileView
            } else {
                collapsedProfileView
            }
            videoList
        }
    }

    var collapsedProfileView: some View {
        HStack {
            profileImage
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
                .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("Berkay Dişli")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: profileName, in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: profileJob, in: profileAnimation)
            }

            Spacer()
        }
        .padding()
    }

    var expandedProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
                .frame(width: 130, height: 130)

            VStack {
                Text("Berkay Dişli")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: profileName, in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.pink)
                    .matchedGeometryEffect(id: profileJob, in: profileAnimation)
                
                Text("I'm eager to improve my skill set in development by creating my own applications and keeping myself up to date by following new technologies.")
                    .padding()
            }
        }
        .padding()
    }

    var profileImage: some View {
        Image("berkay_avatar")
            .resizable()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isProfileExpanded.toggle()
                }
            }
    }

    var videoList: some View {
        List {
            ForEach(0...10, id: \.self) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 180)
                        .foregroundColor(.gray.opacity(0.2))

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.3)
                }
                .padding(.vertical)

            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
