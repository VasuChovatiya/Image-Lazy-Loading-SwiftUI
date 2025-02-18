//
//  ListView.swift
//  Image Lazy Loading SwiftUI
//
//  Created by Kartum Infotech on 15/02/23.
//

import SwiftUI

struct ListView: View {
    
    private var layout = Array(repeating: GridItem(), count: 2)
    var body: some View {
        ScrollView{
            LazyHGrid(rows: layout) {
                //            AsyncImage(url: ImageResponse[0].url) { urlImage in
                //                urlImage
                //                    .resizable()
                //                    .aspectRatio(3/2, contentMode: .fill)
                //
                //            } placeholder: {
                //                Color.gray
                //            }
                
                ForEach(ImageResponse , id: \.self){ photos in
                    AsyncImage(url: photos.download_url) { Image in
                        Image
                            .resizable().cornerRadius(15)
                            .frame(width: 150, height: 150)
                            .aspectRatio(contentMode: .fill)
                    }placeholder: {
                        Color.gray.opacity(0.5)
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                    }
                }
                
            }
            .navigationBarTitle("Async Images")
        }
        
        .onAppear {
            print(ImageResponse
                    .count)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
