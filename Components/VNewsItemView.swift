//
//  SwiftUIView.swift
//
//
//  Created by user2 on 02/02/24.
//

import SwiftUI
struct VNewsItemView: View {
    let news: News
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(.gray)
                    .opacity(0.4)
                HStack(alignment:.center){
                    let urlimage = "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
                    
                    AsyncImage(url:URL(string: urlimage)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(20)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        case .failure(_):
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100)
                        @unknown default:
                            Image("notfound")
                        }
                    }
                    .accessibilityLabel(news.title)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 5.0) {
                        
                        
                        // Title
                        Text(news.title)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                        
                        if !news.category.isEmpty || news.location != nil {
                            HStack {
                                Text(news.category)
                                    .font(.caption2)
                                if let state = news.location {
                                    Text("(\(state))")
                                        .font(.caption2)
                                }
                            }
                            
                        }
                        
                    }
                    
                    .padding( .trailing)
                    .padding(.leading,14)
                    Spacer()
                }
                .padding()
            }
        }
    }


#Preview {
    VNewsItemView(news: News(id: "world-1", title: "Fake Headline About Global Event", content: "Some fake content about a global event.", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false))
}



struct VSNewsItemView: View {
    let news: News
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                    .fill(.gray)
                    .opacity(0.4)
                HStack(alignment:.center){
                    
                    VStack(alignment: .leading, spacing: 5.0) {
                        
                        
                        // Title
                        Text(news.title)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                        
                        if !news.category.isEmpty || news.location != nil {
                            HStack {
                                Text(news.category)
                                    .font(.caption2)
                                if let state = news.location {
                                    Text("(\(state))")
                                        .font(.caption2)
                                }
                            }
                            
                        }
                        
                    }
                    
                    .padding( .trailing)
                    .padding(.leading,14)
                    Spacer()
                }
                .padding()
                
            }
        }
    }


#Preview {
    VNewsItemView(news: News(id: "world-1", title: "Fake Headline About Global Event", content: "Some fake content about a global event.", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false))
}
