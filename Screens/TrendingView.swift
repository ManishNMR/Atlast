import SwiftUI

struct TrendingView: View {
    @State private var hashTags: [Hashtags] = [
        Hashtags(hashtag: "#SwiftUI", count: 25),
        Hashtags(hashtag: "#iOSDev", count: 18),
        Hashtags(hashtag: "#Coding", count: 30),
        Hashtags(hashtag: "#Tech", count: 15),
        Hashtags(hashtag: "#Swift", count: 22),
        Hashtags(hashtag: "#Apple", count: 10),
        Hashtags(hashtag: "#Xcode", count: 17),
        Hashtags(hashtag: "#Programming", count: 28),
        Hashtags(hashtag: "#Developer", count: 14),
        Hashtags(hashtag: "#TodaysNews", count: 9),
        Hashtags(hashtag: "#TomorrowsNews", count: 11),
        Hashtags(hashtag: "#HelloNews", count: 21),
        Hashtags(hashtag: "#MyNews", count: 4),
        Hashtags(hashtag: "#iNews",  count: 53)
    ]
    @State private var isSheetPresented: Bool = false
    @State private var userHashtag: String = ""

    var body: some View {
        VStack {
            Text("Trending #Tags")
                .font(.title)
                .bold()
                .padding()

            // Display sorted hashtags
            ZStack {
                List(hashTags.sorted(by: { $0.count > $1.count })) { hashtag in
                    HStack {
                        Text("\(hashtag.hashtag)")
                            .padding(.leading, 40)
                        Spacer()
                        Image(systemName: "suit.heart")
                        Text("\(hashtag.count)")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.pink)
                    }
                }
                .listStyle(PlainListStyle())
                
                
                // Button to show custom sheet for entering hashtags
                HStack{
                    Spacer()
                if !isSheetPresented {
                    Button(action: {
                        withAnimation {
                            isSheetPresented.toggle()
                        }
                    }) {
                        
                        Image(systemName: "ellipsis.message.fill")
                            .font(Font.system(size: 50))
                            .foregroundColor(.blue)
                            .padding()
                    }
                    }
                }
                .offset(y:250)
            }

            // Custom sheet for entering hashtags
            if isSheetPresented {
                ZStack {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    isSheetPresented = false
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }

                        Text("Your Hashtag of the Day")
                            .font(.headline)
                            .padding()

                        TextField("Enter your hashtag", text: $userHashtag)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Spacer()

                        Button("Submit") {
                            submitHashtag()
                            withAnimation {
                                isSheetPresented = false
                            }
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        .padding()
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                    .frame(height: 150) // Adjust the height as needed
                    .transition(.slide)
                }
            }
        }
        .navigationBarTitle("Trending Hashtags", displayMode: .inline)
    }

    private func submitHashtag() {
        guard userHashtag.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false else {
            return
        }

        let formattedHashtag = userHashtag.lowercased().hasPrefix("#") ? userHashtag : "#\(userHashtag)"

        if let index = hashTags.firstIndex(where: { $0.hashtag.lowercased().starts(with: formattedHashtag.lowercased()) }) {
            hashTags[index].count += 1
        } else {
            hashTags.append(Hashtags(hashtag: formattedHashtag, count: 60))
        }

        // Sort hashtags based on the count in descending order
        hashTags.sort {
            $0.count > $1.count
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
