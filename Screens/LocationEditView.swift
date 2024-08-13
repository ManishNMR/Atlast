
import SwiftUI


import SwiftUI

struct LocationEditView: View {
    @Binding var selectedLocation: String
    @State private var searchText: String = ""
    @State private var isSearchActive: Bool = false
    var onLocationSelected: (String) -> Void

    let indianStates = [
        "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
        "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
        "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
        "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan",
        "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh",
        "Uttarakhand", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh",
        "Dadra and Nagar Haveli", "Daman and Diu", "Lakshadweep", "Delhi", "Puducherry"
    ]

    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                    TextField("Search", text: $searchText)
                        .onChange(of: searchText) { text in
                            isSearchActive = !text.isEmpty
                        }
                }
                .foregroundStyle(Color.black)
                .padding(.horizontal, 8)
                .frame(width: 319, alignment: .leading)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)

                VStack {
                    HStack {
                        ForEach(cities.prefix(4)) { city in
                            Button(action: {
                                selectedLocation = city.name
                                onLocationSelected(city.name)
                            }) {
                                CityButtonView(city: city)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 30)

                    HStack {
                        ForEach(cities.suffix(4)) { city in
                            Button(action: {
                                selectedLocation = city.name
                                onLocationSelected(city.name)
                            }) {
                                CityButtonView(city: city)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .padding()

                Text("States")
                    .foregroundStyle(Color.white)
                    .offset(x: -150)
                    .padding(.top, 20)

                if !isSearchActive {
                    // Show unfiltered states when the search text is empty
                    List {
                        ForEach(indianStates, id: \.self) { state in
                            Button(action: {
                                selectedLocation = state
                                onLocationSelected(state)
                            }) {
                                Text(state)
                            }
                        }
                        .listRowBackground(Color.black)
                        .listRowSeparatorTint(.blue, edges: .bottom)
                    }
                    .listStyle(.plain)
                    .background(Color.black)
                    .padding()
                    .padding(.trailing, 20)
                } else {
                    // Show filtered and sorted states when the search text is not empty
                    List(filteredAndSortedStates(), id: \.self) { state in
                        Button(action: {
                            selectedLocation = state
                            onLocationSelected(state)
                        }) {
                            Text(state)
                        }
                        .listRowBackground(Color.black)
                        .listRowSeparatorTint(.blue, edges: .bottom)
                    }
                    .listStyle(.plain)
                    .padding()
                    .padding(.trailing, 20)
                }
            }
        }
        .background(Color.black)
    }

    private func filteredAndSortedStates() -> [String] {
        return indianStates
            .filter { state in
                state.localizedCaseInsensitiveContains(searchText)
            }
            .sorted()
    }
}

struct CityButtonView: View {
    let city: City

    var body: some View {
        VStack {
            Image(city.imageTag)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(city.name)
        }
    }
}


#Preview{
    LocationEditView(selectedLocation: .constant("India"), onLocationSelected: { _ in })
}
