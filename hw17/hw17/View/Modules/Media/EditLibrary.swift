import SwiftUI

struct EditLibrary: View {
    @State var selectedItems = Set<String>()
    
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(LibraryData.libraryData) { item in
                ListItem(nameImage: item.nameImage, name: item.name, isSelect: selectedItems.contains(item.name))
            }
            .onMove { (indexSet, index) in
                LibraryData.libraryData.move(fromOffsets: indexSet, toOffset: index)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Медиатека")
    }
}

struct EditLibrary_Previews: PreviewProvider {
    static var previews: some View {
        EditLibrary()
    }
}

struct ListItem: View {
    var nameImage: String
    var name: String
    var isSelect: Bool
    
    var body: some View {
        HStack {
            Image(systemName: nameImage)
                .foregroundColor(.red)
            if isSelect {
                Text(name)
                    .bold()
            } else {
                Text(name)
            }
        }
    }
}
