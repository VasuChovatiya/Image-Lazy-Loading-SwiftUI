//
//  AnimalModel.swift
//  Image Lazy Loading SwiftUI
//
//  Created by Kartum Infotech on 14/02/23.
//

import Foundation

var ImageResponse:[Photo] = []

enum FetchPhotosError: Error {
    case noData
    case invalidData
    case other(error: Error)
}

struct Photo: Codable , Hashable{
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL
    let download_url: URL
}

func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
    let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=100")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            completion(.failure(FetchPhotosError.noData))
            return
        }
        do {
            let photos = try JSONDecoder().decode([Photo].self, from: data)
            Task{
                await ImageResponse = photos
            }
            completion(.success(photos))
            
        } catch {
            completion(.failure(error))
        }
    }
    task.resume()
}
