import SwiftUI

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

struct MainLibrary_Previews: PreviewProvider {
    static var previews: some View {
        MainLibrary()
    }
}
