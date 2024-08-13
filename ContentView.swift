import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                MainView()
                    .tag(Tab.house)
                LocalNewsView()
                    .tag(Tab.map)
                SearchView()
                    .tag(Tab.magnifyingglass)
                TrendingView()
                    .tag(Tab.doc)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide tab bar
            
            CustomTabBar(selectedTab: $selectedTab)
                .background(.thinMaterial)
                .cornerRadius(18)
                .padding()
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical)
        .padding(.top, 30)
        .padding(.horizontal,5)
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button(action: { selectedTab = tab }) {
                    Image(systemName: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .blue : .white)
                        .font(.system(size: 20))
                }
                Spacer()
            }
        }
        .frame(height: 48)
    }
}

enum Tab: String, CaseIterable {
    case house = "house"
    case map = "map"
    case magnifyingglass = "magnifyingglass"
    case doc = "doc"
}
