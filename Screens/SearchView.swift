import SwiftUI

struct SearchView: View {
    @State private var newsArticles: [News] = mockNews
    @State private var selectedCategory: String = "All"
    @State private var searchText: String = ""
    @State private var isSearchActive: Bool = false

    var SfilteredNews: [News] {
        if isSearchActive && !searchText.isEmpty {
            return newsArticles.filter { news in
                return news.title.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            if selectedCategory == "All" {
                return newsArticles
            } else {
                return newsArticles.filter { $0.category == selectedCategory }
            }
        }
    }

    var filteredNews: [News] {
        if selectedCategory == "All" {
            return newsArticles
        } else {
            return newsArticles.filter { $0.category == selectedCategory }
        }
    }

    var body: some View {
        VStack {
            NavigationStack {
                ZStack {
                    VStack {
                        HStack {
                            Image("iNewsImage")
                                .resizable()
                                .frame(width: 64, height: 27)
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }
                        .padding()
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white)
                            .padding(.top, 6)
                            .padding(.bottom, 2)
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "magnifyingglass")
                                .padding()
                            TextField("Search", text: $searchText)
                                .onChange(of: searchText) { text in
                                    isSearchActive = !text.isEmpty
                                }
                            if isSearchActive {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .frame(width: 319, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(10)
                        .opacity(0.8)
                        ScrollView{
                            if isSearchActive {
                                ScrollView(.vertical, showsIndicators: true) {
                                    ForEach(SfilteredNews) { news in
                                        NavigationLink(destination: NewsDetailView(news: news)) {
                                            VSNewsItemView(news: news)
                                        }
                                    }
                                    .foregroundStyle(Color.white)
                                }
                            } else {
                                VStack {
                                    
                                    if UIScreen.main.bounds.width > 400 {
                                        MultipleJumpingBalls()
                                    }
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        HStack {
                                            Text("Trending")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(filteredNews) { news in
                                                    NavigationLink(destination: NewsDetailView(news: news)) {
                                                        HINewsItemView(news: news)
                                                    }
                                                    .padding(.horizontal, 0)
                                                }
                                                .padding(0)
                                                .frame(width: 380, height: 240)
                                                
                                            }
                                        }
                                        
                                        HStack {
                                            Text("Top News")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(filteredNews) { news in
                                                    NavigationLink(destination: NewsDetailView(news: news)) {
                                                        ZStack {
                                                            HINewsItemView(news: news)
                                                            
                                                            VStack {
                                                                Spacer()
                                                                // Push headline to top
                                                                ZStack {
                                                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                                                        .foregroundStyle(Color.white)
                                                                        .opacity(0.6)
                                                                    Text(news.title)
                                                                        .font(.headline)
                                                                        .fontWeight(.bold)
                                                                        .foregroundColor(.black)
                                                                        .padding(.leading)
                                                                        .shadow(color: .white, radius: 2, x: 2, y: 2)
                                                                }
                                                                .offset(y:-2)
                                                                .frame(height: 50)
                                                                // Adjust padding as needed
                                                                
                                                            }
                                                        }
                                                    }
                                                    .padding(.horizontal, 0)
                                                }
                                                .padding(0)
                                                .frame(width: 380, height: 240)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .foregroundColor(.clear)
                    .background(Color.black)
                }
            }
        }
        .onAppear {
            // Additional code specific to iPad can be added here
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
