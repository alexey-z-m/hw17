import SwiftUI

struct LibraryView: View {
    @State var editLibrary = false
    var body: some View {
        NavigationView {
            if editLibrary {
                EditLibrary()
                    .environment(\.editMode, .constant(EditMode.active))
                    .navigationBarItems(trailing: Button(action: {
                        editLibrary.toggle()
                    }) {
                        Text("Готово")
                            .foregroundColor(.red)
                    })
            } else {
                MainLibrary()
                    .navigationBarItems(trailing: Button(action: {
                        editLibrary.toggle()
                    }) {
                        Text("Править")
                            .foregroundColor(.red)
                    })
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
    @State var selectedItems = Set<String>()
    
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(LibraryData.libraryData) { item in
                HStack {
                    Image(systemName: item.nameImage)
                        .foregroundColor(.red)
                    Text(item.name)
                }
            }
            .onMove { (indexSet, index) in
                LibraryData.libraryData.move(fromOffsets: indexSet, toOffset: index)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Медиатека")
    }
}

struct LibraryData: Identifiable {
    let name: String
    let nameImage: String
    var id: String { name }
}

extension LibraryData {
    static var libraryData: [LibraryData] = [
        LibraryData(name: "Плейлисты", nameImage: "music.note.list"),
        LibraryData(name: "Артисты", nameImage: "music.mic"),
        LibraryData(name: "Альбомы", nameImage: "square.stack"),
        LibraryData(name: "Песни", nameImage: "music.note"),
        LibraryData(name: "Телешоу и фильмы", nameImage: "tv"),
        LibraryData(name: "Видеоклипы", nameImage: "music.note.tv"),
        LibraryData(name: "Жанры", nameImage: "guitars"),
        LibraryData(name: "Сборники", nameImage: "person.2.crop.square.stack"),
        LibraryData(name: "Авторы", nameImage: "music.quarternote.3"),
        LibraryData(name: "Загружено", nameImage: "arrow.down.circle"),
        LibraryData(name: "Домашняя коллекция", nameImage: "music.note.house")]
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .preferredColorScheme(.dark)
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
