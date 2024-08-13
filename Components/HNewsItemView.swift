//
//  SwiftUIView.swift
//
//
//  Created by user2 on 02/02/24.
//

import Foundation
import SwiftUI
struct HNewsItemView: View {
    let news: News
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.white)
                .cornerRadius(20)
                .opacity(0.2)
                .frame(height: 230)
            ZStack {
                let urlimage = "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
                
                AsyncImage(url:URL(string: urlimage)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(height: 230)
                            .cornerRadius(20)
                            .shadow(radius: 15)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .frame(height: 100)
                            .overlay(Text("Image failed to load"))
                    @unknown default:
                        Image("notfound")
                    }
                }
            
                VStack {
                    Spacer()
                    // Push headline to top
                    ZStack {
                        RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.white)
                            .opacity(0.6)
                        Text(news.title)
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .padding(.leading)
                        .shadow(color: .white, radius: 2, x: 2, y: 2)
                    }
                    .frame(height: 50)
                    // Adjust padding as needed
                        
                }
                //        ZStack{
                //
                //            let urlimage = "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
                //
                //            AsyncImage(url:URL(string: urlimage)) { phase in
                //                switch phase {
                //                case .empty:
                //                    ProgressView()
                //                case .success(let image):
                //                    image
                //                        .resizable()
                //                        .frame(height: 230)
                //                case .failure(_):
                //                    Image(systemName: "photo")
                //                        .resizable()
                //                        .frame(width: 100, height: 100)
                //                        .overlay(Text("Image failed to load"))
                //                @unknown default:
                //                    Image("notfound")
                //                }
                //            }
                //            VStack {
                //                // Push headline to top
                //                Text(news.title)
                //                    .font(.title2)
                //                    .foregroundColor(.white)
                //
                //                    .frame(height: 60)
                //                    .offset(y: -20)
                //                    .padding(.top, 40)
                //                    .padding(.leading, 4)
                //                    .multilineTextAlignment(.leading)
                //                Spacer()
                //            }
                //
                
            }
           
        }
        }
        
    }
    
    
    #Preview {
        HNewsItemView(news: News(id: "world-1", title: "Fake Headline About Global Event", content: "Some fake content about a global event.", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false))
    }


//

struct HINewsItemView: View {
    let news: News
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.white)
                .cornerRadius(20)
                .opacity(0.2)
            ZStack {
                let urlimage = "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
                
                AsyncImage(url:URL(string: urlimage)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(height: 230)
                            .cornerRadius(20)
                            .shadow(radius: 15)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .frame(height: 100)
                            .overlay(Text("Image failed to load"))
                    @unknown default:
                        Image("notfound")
                    }
                }
                
            }
        }
        }
        
    }
    
    
    #Preview {
        HNewsItemView(news: News(id: "world-1", title: "Fake Headline About Global Event", content: "Some fake content about a global event.", imageURL: "", category: "World", location: nil, isTopNews: true, isTrending: false))
    }
