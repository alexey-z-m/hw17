//
//  TopRadioView.swift
//  hw17
//
//  Created by Panda on 05.09.2022.
//

import SwiftUI

struct TopRadioView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(RadioData.radioData) { item in
                    Button(action: {}) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.type)
                                .foregroundColor(.secondary)
                                .font(.system(size: 15))
                            Text(item.name)
                                .frame(minWidth: 380, alignment: .leading)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text(item.discription)
                                .frame(minWidth: 380, alignment: .leading)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            Image(item.nameImage)
                                .resizable()
                                .frame(width: 380, height: 240)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct TopRadioView_Previews: PreviewProvider {
    static var previews: some View {
        TopRadioView()
    }
}
