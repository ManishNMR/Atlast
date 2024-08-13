import SwiftUI

struct LocalNewsView: View {
    @State private var isSheetPresented: Bool = false
    @AppStorage("selectedLocation") private var selectedLocation: String = "World"
    @State private var newsArticles: [News] = mockNews
    var filteredNews: [News] {
        return newsArticles.filter { $0.category == selectedLocation }
    }

    var body: some View {
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
            .padding([.leading, .bottom, .trailing])

            HStack {
                Text(selectedLocation.isEmpty ? "All" : selectedLocation)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.4))
                            .frame(height: 33)
                    )

                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Image(systemName: "pencil")
                        .foregroundStyle(.white)
                }
                .sheet(isPresented: $isSheetPresented) {
                    NavigationView {
                        LocationEditView(selectedLocation: $selectedLocation) { _ in
                            isSheetPresented.toggle()
                        }
                        .foregroundColor(.white)
                        .navigationBarItems(
                            trailing: Button(action: {
                                isSheetPresented.toggle()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                            }
                        )
                    }
                }
                .padding(.leading)
                .foregroundColor(.white)
                .offset(x: 20)
            }
            .offset(x: 20)

            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.white)
                .padding(.bottom, 2)

            if filteredNews.isEmpty {
                Text("No News")
                    .foregroundColor(.white)
                    .padding()
            } else {
                ScrollView(.vertical) {
                    ForEach(filteredNews) { news in
                        VNewsItemView(news: news)
                    }
                    .foregroundStyle(.white)
                }
            }
            
            Spacer()
        }
        .background(Color.clear)
        .ignoresSafeArea()
    }
}

struct LocalNewsView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNewsView()
    }
}
