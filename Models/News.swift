//
//  File.swift
//
//
//  Created by user2 on 02/02/24.
//

import Foundation

struct News: Identifiable {
    let id: String // Unique identifier
    let title: String // News headline
    let content: String // Brief news summary
    let imageURL: String // URL of the news image (optional)
    let category: String // News category (e.g., "World", "India", "Business", "Tech", "Sports", "Entertainment")
    let location: String? // location-specific news (optional) // You mentioned 2 locations, so make these "location1" and "location2" for now
    let isTopNews: Bool // Mark top news
    let isTrending: Bool // Mark trending news
}


let mockNews: [News] = [
    // World News
    News(id: "world-1", title: "Fake Headline About Global Event", content: "Some fake content about a global event.", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false),
    News(id: "world-2", title: "Another Fake Headline About International Issue", content: "More fake content about an international issue.", imageURL: "", category: "World", location: nil, isTopNews: false, isTrending: true),
    // India News
    News(id: "india-1", title: "Fake Headline About National Development", content: "Fake content about national development.", imageURL: "", category: "India", location: nil, isTopNews: false, isTrending: true),
    News(id: "india-2", title: "Another Fake Headline About Local Event", content: "Fake content about a local event in India.", imageURL: "", category: "India", location: "location1", isTopNews: false, isTrending: false),
    // Business News
    News(id: "business-1", title: "Fake Headline About Market Fluctuation", content: "Fake content about a market fluctuation.", imageURL: "", category: "Business", location: nil, isTopNews: true, isTrending: false),
    News(id: "business-2", title: "Another Fake Headline About Company Acquisition", content: "Fake content about a company acquisition.", imageURL: "", category: "Business", location: "location2", isTopNews: false, isTrending: true),
    News(id: "world-3", title: "International Space Collaboration Achieves Milestone in Deep Space Exploration", content: "Collaborative project launches a probe to study a distant exoplanet...", imageURL: "", category: "World", location: nil, isTopNews: false, isTrending: true),
    News(id: "world-4", title: "Global Climate Summit Reaches Agreements on Emission Reduction Targets", content: "Leading nations commit to ambitious goals for carbon neutrality...", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false),
    // India News
    News(id: "india-3", title: "Local Community Initiative Empowers Women Entrepreneurs", content: "Grassroots program provides training and resources...", imageURL: "", category: "India", location: "location1", isTopNews: false, isTrending: true),
    News(id: "india-4", title: "Archaeological Discovery Unearths Ancient Civilization's Secrets", content: "Newly unearthed artifacts shed light on a previously unknown civilization...", imageURL: "", category: "India", location: nil, isTopNews: true, isTrending: false),
    // Business News
    News(id: "business-3", title: "Ethical Fashion Brand Celebrates Sustainable Production Practices", content: "Company's commitment to fair labor and eco-friendly materials...", imageURL: "", category: "Business", location: nil, isTopNews: false, isTrending: true),
    News(id: "business-4", title: "Startup Develops Revolutionary Technology to Combat Food Waste", content: "Innovative solution extends shelf life and reduces food spoilage...", imageURL: "", category: "Business", location: "location2", isTopNews: true, isTrending: false),
    // Tech News
    News(id: "tech-3", title: "Open-Source Project Creates Accessible Assistive Technology", content: "Collaborative effort develops affordable and adaptable tools...", imageURL: "", category: "Tech", location: nil, isTopNews: true, isTrending: false),
    News(id: "tech-4", title: "AI-Powered Education Platform Personalizes Learning for Students", content: "Technology tailors curriculum and instruction to individual needs...", imageURL: "", category: "Tech", location: nil, isTopNews: false, isTrending: true),
    // Sports News
    News(id: "sports-3", title: "Adaptive Athlete Breaks Barriers in Paralympic Competition", content: "Inspiring performance demonstrates the power of resilience...", imageURL: "", category: "Sports", location: nil, isTopNews: true, isTrending: true),
    News(id: "sports-4", title: "Grassroots Sports Program Fosters Teamwork and Healthy Habits", content: "Initiative promotes physical activity, social interaction, and positive values...", imageURL: "", category: "Sports", location: "location1", isTopNews: false, isTrending: false),
    // Entertainment News
    News(id: "entertainment-3", title: "Documentaries Raise Awareness of Important Social Issues", content: "Films shed light on critical topics like environmental protection...", imageURL: "", category: "Entertainment", location: nil, isTopNews: false, isTrending: true),
    News(id: "entertainment-4", title: "Diverse Creators Showcase New Voices and Perspectives", content: "Emerging artists break down barriers and redefine representation...", imageURL: "", category: "Entertainment", location: nil, isTopNews: true, isTrending: false),
    // ... (a
]
