//
//  SettingView.swift
//  iNews
//
//  Created by user2 on 02/02/24.
//

import SwiftUI

struct MainView: View {
    @State private var newsArticles: [News] = mockNews
    @State private var selectedCategory: String = "All"
    
    var filteredNews: [News] {
        if selectedCategory == "All" {
            return newsArticles
        } else {
            return newsArticles.filter { $0.category == selectedCategory }
        }
    }
    
    var body: some View {
        VStack{
            NavigationStack {
                ZStack{
                    VStack{
                        HStack {
                            Text("iNews")
                                .foregroundStyle(.red)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 30,height: 30)
                        }
                        .padding([.leading, .bottom, .trailing])
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:24){
                                Button("All") { selectedCategory = "All" }
                                    .foregroundColor(selectedCategory == "All" ? .blue : .white)
                                Button("India") { selectedCategory = "India" }
                                    .foregroundColor(selectedCategory == "India" ? .blue : .white)
                                Button("World") { selectedCategory = "World" }
                                    .foregroundColor(selectedCategory == "World" ? .blue : .white)
                                Button("Sports") { selectedCategory = "Sports" }
                                    .foregroundColor(selectedCategory == "Sports" ? .blue : .white)
                                Button("Entertainment") { selectedCategory = "Entertainment" }
                                    .foregroundColor(selectedCategory == "Entertainment" ? .blue : .white)
                                Button("Tech") { selectedCategory = "Tech" }
                                    .foregroundColor(selectedCategory == "Tech" ? .blue : .white)
                                Button("Buisness") { selectedCategory = "Buisness" }
                                    .foregroundColor(selectedCategory == "Buisness" ? .blue : .white)
                            }
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                            .padding(.horizontal)
                        }
                        .opacity(0.8)
                        
                        
                        Rectangle()
                            .frame( height: 1)
                            .foregroundStyle(Color.white)
                            .padding(.top,6)
                            .padding(.bottom, 2)
                        
                        //                    ScrollView(.horizontal,showsIndicators: false){
                        //                        HStack {
                        //                            ForEach(filteredNews) { news in
                        //                                HNewsItemView(news: news)
                        //                            }
                        //                            .padding(0)
                        //                            .frame(width: 400)
                        //                        }
                        //                    }
                        //                    .padding(0)
                        //
                        ScrollView(.vertical){
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack {
                                    
                                    ForEach(filteredNews) { news in
                                        NavigationLink(destination: NewsDetailView(news: news)) {
                                            HNewsItemView(news: news)
                                            
                                        }
                                        .padding(.horizontal,0)
                                    }
                                    .padding(0)
                                    .frame(width: 380)
                                }
                            }
                            .padding(0)
                            ForEach(filteredNews) { news in
                                NavigationLink(destination: NewsDetailView(news: news)) {
                                    VNewsItemView(news: news)
                                }
                            }
                            .foregroundStyle(Color.white)
                        }
                    }
                    
                }
                .foregroundStyle(Color.clear)
                .background(Color.black)
                
                
            }
        }
    }
}

#Preview {
    MainView()
}
