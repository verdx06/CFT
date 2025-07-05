//
//  ItemView.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import SwiftUI

struct ItemView: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: item.image)) { image in
                    image.resizable().frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.system(size: 12))
                    Text("Price: \(item.price)")
                        .font(.system(size: 10))
                        .bold()
                }
                Spacer()
                HStack(spacing: 0){
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", item.rating.rate))
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ItemView(item: ItemModel.mockItem())
}
