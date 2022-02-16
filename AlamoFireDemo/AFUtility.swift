//
//  AFUtility.swift
//  AlamoFireDemo
//
//  Created by comviva on 09/02/22.
//87f107b39b6cabaac95de56f63367039

import Foundation
import Alamofire



class AFUtility{
    private init(){
        
    }
    let apiKey = "87f107b39b6cabaac95de56f63367039"
    static var instance = AFUtility()
    
    func downloadImage(imgUrl : String, completion: @escaping (Data) -> Void){
        if let url = URL(string: imgUrl) {
        
            Session.default.download(url).responseData { (imgData) in
                switch imgData.result{
                    
                case .success(let data):
                    print("Image downloaded")
                    completion(data)
                    
                case .failure(let err):
                    print("Error downloading \(err.errorDescription ?? "")")
                }
            }
        }
        
    }

    func getPopularMovies(completion: @escaping (TMDBResult) -> Void){
        let movieUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        guard let url = URL(string: movieUrl)else{
            print("Url creation failed")
            return
        }
        Session.default.request(url).responseDecodable(of: TMDBResult.self) { (resp) in
          if  resp.error==nil {
                print("success")
                switch resp.result{
                case .success(let data):
                    print("Response received\(data.results.count)")
                    completion(data)
                case .failure(let err):
                    print("error is \(err.localizedDescription)")
                }
                
            }
            
        }
        
    }
    
}
