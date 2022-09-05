//
//  RadioStationsView.swift
//  hw17
//
//  Created by Panda on 05.09.2022.
//

import SwiftUI

struct RadioStationsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Станции")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.largeTitle)
            
            LazyVGrid(columns: [GridItem()]) {
                ForEach(RadioData.radioData) { item in
                   Button(action: {}) {
                        HStack{
                            Image(item.nameImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 100, alignment: .center)
                                .cornerRadius(10)
                                .padding(.leading)
                            LazyVStack (alignment: .leading) {
                                Text(item.name)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text(item.discription)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                    }
                   .foregroundColor(.accentColor)
                    Divider()
                }
            }
        }
    }
}

struct RadioStationsView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationsView()
    }
}
