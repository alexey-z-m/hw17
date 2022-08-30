import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text(Strings.media)
                    }
                Text("Radio")
                    .tabItem {
                        Text(Strings.radio)
                        Image(systemName: "dot.radiowaves.left.and.right")
                    }
                Text("Search")
                    .tabItem {
                        Text(Strings.search)
                        Image(systemName: "magnifyingglass")
                    }
            }
            .accentColor(.red)
            NowPlayingBar().padding(.bottom, 50)
        }
        
    }
}

struct NowPlayingBar: View {
    @State var play = false
    var body: some View {
        ZStack() {
            Rectangle()
                .frame(width: UIScreen.screenWidth, height: 90)
                .foregroundColor(Color.white.opacity(0.0))
                .background(.ultraThinMaterial).opacity(0.5)
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .shadow(radius: 6)
                            .padding(.leading, 20)
                        Text("Some artist")
                            .font(.headline)
                            .padding(.leading, 20)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {play.toggle()}) {
                    if play {
                        Image(systemName: "pause.fill")
                            .font(.title3)
                    } else {
                    Image(systemName: "play.fill")
                        .font(.title3)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                Button(action: {}) {
                    Image(systemName: "forward.fill").font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 30)
            }
        }//.padding()
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

extension ContentView {
    enum Strings {
        static let media = "Медиатека"
        static let radio = "Радио"
        static let search = "Поиск"
        
    }
}
