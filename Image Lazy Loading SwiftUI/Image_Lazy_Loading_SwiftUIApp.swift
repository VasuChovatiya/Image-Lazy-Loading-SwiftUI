//
//  Image_Lazy_Loading_SwiftUIApp.swift
//  Image Lazy Loading SwiftUI
//
//  Created by Kartum Infotech on 14/02/23.
//

import SwiftUI

@main
struct Image_Lazy_Loading_SwiftUIApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task{
                         await
                        fetchPhotos { result in
                            switch result{
                            case .success((let photos)):
                                print(photos)
                            case .failure((let erorr)):
                                print(erorr)
                            }

                    }
                    }
                }
        }
    }
}
