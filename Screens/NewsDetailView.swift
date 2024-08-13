import SwiftUI

struct NewsDetailView: View {
    let news: News

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: news.imageURL)) { phase in
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
                .frame(width: 400)
                .padding()

                Text(news.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                VStack {
                    Text(news.content)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                .foregroundStyle(Color.white)
                .backgroundStyle(Color.gray)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color.gray)
                        .opacity(0.6)
                )
                
                Spacer()
            }
            .padding(.top, 20) // Add padding at the top
            .navigationBarTitle(news.title, displayMode: .inline)
        }
        .background(Color.clear)
        .padding(.top,30)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: News(id: "UniqueID", title: "This is a title", content: "Example content...", imageURL: "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg", category: "", location: "Chennai", isTopNews: true, isTrending: true))
    }
}
