//
//  File.swift
//  
//
//  Created by user2 on 04/02/24.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let imageTag: String
}

let cities: [City] = [
    City(name: "Chennai", imageTag: "chennaiImage"),
    City(name: "Bangalore", imageTag: "bangaloreImage"),
    City(name: "Delhi", imageTag: "delhiImage"),
    City(name: "Mumbai", imageTag: "mumbaiImage"),
    City(name: "Kolkata", imageTag: "kolkataImage"),
    City(name: "Jaipur", imageTag: "jaipurImage"),
    City(name: "Goa", imageTag: "goaImage"),
    City(name: "Pune", imageTag: "puneImage")
]


struct Hashtags : Identifiable {
    let id = UUID()
    let hashtag: String
    var count : Int
}

let hashTags: [Hashtags] = [
    Hashtags(hashtag: "#SwiftUI", count: 25),
        Hashtags(hashtag: "#iOSDev", count: 18),
        Hashtags(hashtag: "#Coding", count: 30),
        Hashtags(hashtag: "#Tech", count: 15),
        Hashtags(hashtag: "#Swift", count: 22),
        Hashtags(hashtag: "#Apple", count: 10),
        Hashtags(hashtag: "#Xcode", count: 17),
        Hashtags(hashtag: "#Programming", count: 28),
        Hashtags(hashtag: "#Developer", count: 14)
]
