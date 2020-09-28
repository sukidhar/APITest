//
//  APIManager.swift
//  APITest
//
//  Created by Sukidhar Darisi on 28/9/20.
//

import Foundation



struct APIManager{
    
    func getURL()->URL?{
        let urlString = "http://15.207.150.183/API/index.php?p=videoTestAPI"
        return URL(string: urlString)
    }
    
    func peformRequest(handler : @escaping ([DataModel]
    )->()){
        if let url = getURL(){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (rawdata, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                if let data = rawdata{
                    let decoder = JSONDecoder()
                    print(data)
                    if let decodedData = try? decoder.decode(APIData.self, from: data){
                        handler(decodedData.msg)
                    }
                }
            }
            task.resume()
        }
    }
    
    
}
