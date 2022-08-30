import SwiftUI

struct LibraryView: View {
    @State var editLibrary = true
    var body: some View {
        NavigationView {
            if editLibrary {
                EditLibrary()
                    .toolbar {
                        NavigationLink {} label: {
                            Button(action: {
                                editLibrary.toggle()
                                
                            }) {
                                Text("Готово")
                                    .foregroundColor(.red)
                            }
                        }
                    }
            } else {
                MainLibrary()
                    .toolbar {
                        NavigationLink {} label: {
                            Button(action: {
                                editLibrary.toggle()
                            }) {
                                Text("Править")
                                    .foregroundColor(.red)
                            }
                        }
                    }
            }
        }
    }
}

struct MainLibrary: View {
    var body: some View {
        VStack {
            Text("Ищите свою музыку?")
                .bold()
                .font(.system(size: 31))
                .navigationTitle("Медиатека")
            Text("Здесь появится купленная Вами в iTunes Store музыка")
                .font(.system(size: 23))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct EditLibrary: View {
    @State var selectedItems = Set<UUID>()
    let libraryItems = ["1","2","3","4","5","6","7","8","9","10","11"]
    @State var selections: [String] = []
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(libraryItems, id: \.self) { item in
                MultipleSelectionRow(title: item, isSelected: selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: { $0 == item })
                    }
                    else {
                        self.selections.append(item)
                    }
                }
            }
        }
        .navigationTitle("Медиатека")
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                if self.isSelected {
                    Text(self.title)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "checkmark")
                        .listRowBackground(Color.red)
                } else {
                    Text(self.title)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
