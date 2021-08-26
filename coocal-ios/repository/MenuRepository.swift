//
//  MenuRepository.swift
//  coocal-ios
//
//  Created by agumy on 2021/08/20.
//

import Foundation

//JSON Decodeのための構造体
struct User: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [Item]

    struct Item: Codable {
        let login: String
        let id: Int
        let node_id: String
        let avatar_url: URL
        let gravatar_id: String?
        let url: URL
        let html_url: URL
        let followers_url: URL
        let subscriptions_url: URL
        let organizations_url: URL
        let repos_url: URL
        let received_events_url: URL
        let type: String
        let score: Double
    }
}

func searchGithubUser(query: String, completion: @escaping (User) -> ()) {
    let url = URL(string: "https://api.github.com/search/users?q=" + query)!
    let request = URLRequest(url: url)
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            let user: User = try decoder.decode(User.self, from: data)
            completion(user)
        } catch let e {
            print("JSON Decode Error :\(e)")
            fatalError()
        }    }
    task.resume()
}

func fetchMenus() {
    
}
