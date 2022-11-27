//
//  Client.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 25.11.2022.
//

import Foundation

class Client {
    
    enum Endpoints {
        static let base = "https://www.breakingbadapi.com/api"
        
        case characters
        case episodes
        case characterDetail(Int)
        case quotes(String)
        case episodeActor(Int)
        
        
        var stringValue: String {
            switch self {
            case .characters:
                return Endpoints.base + "/characters?category=Breaking+Bad"
            case .episodes:
                return Endpoints.base + "/episodes?series=Breaking+Bad"
            case .characterDetail(let characterId):
                return Endpoints.base + "/characters/\(characterId)/?category=Breaking+Bad"
            case .quotes(let author):
                return Endpoints.base + "/quote?author=\(author)"
            case .episodeActor(let episodeId):
                return Endpoints.base + "/episodes/\(episodeId)/?series=Breaking+Bad"
            }
            
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responsetType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
    class func getCharacters(completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.characters.url, responsetType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getEpisodes(completion: @escaping ([EpisodeModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodes.url, responsetType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getCharacterDetail(character: Int, completion: @escaping ([CharacterDetailModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.characterDetail(character).url, responsetType: [CharacterDetailModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getQuotes(author:String, completion: @escaping ([QuoteModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.quotes(author).url, responsetType: [QuoteModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getEpisodeActor(episodeID:Int, completion: @escaping ([EpisodeModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodeActor(episodeID).url, responsetType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    
}

