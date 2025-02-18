//
//  ContentView.swift
//  Image Lazy Loading SwiftUI
//
//  Created by Kartum Infotech on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink{
                ListView()
            }label: {
                Text("Go to Second View")
            }
        }
        
        .onAppear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
