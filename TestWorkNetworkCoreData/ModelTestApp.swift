//
//  ModelTestApp.swift
//  TestWorkNetworkCoreData
//
//  Created by Genuine on 2/28/19.
//  Copyright © 2019 Genuine. All rights reserved.
//

import Foundation



func httpGET() {
    
    let httpURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    let httpTask = URLSession.shared.dataTask(with: httpURL) {
        (data, response, error) in
        guard let _ = data, error == nil else {
            DispatchQueue.main.async(execute: {
                print("Error getting jsonplaceholder website\n") })
            return
        }
        var results = String(data: data!, encoding: String.Encoding.utf8) ?? "Error decoding jsonplaceholder website HTML\n"
        DispatchQueue.main.async(execute: {
            print("Correctly read \(results.count) characters from jsonplaceholder website HTML\n")

            print(dividingString(httpString: &results))

        })
    }
    DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
        httpTask.resume()
    })
}
func dividingString(httpString: inout String) {
    
    var data : [String] = []
    var titles = [String]()
    var imagesURL = [String]()
    
    for _ in 0...99 {
        let slice = httpString.slice(from: "{", to: "}")
        data.append(slice)
        guard let lowerBoundIndex = httpString.firstIndex(of: "{") else {return}
        guard let upperBoundIndex = httpString.firstIndex(of: "}") else {return}
        httpString.removeSubrange(lowerBoundIndex...upperBoundIndex)
        // print(data.indices)
    }
    
    print(data[22])
    
    for data in data {
        
        var title = data.slice(from: "\"title\": ", to:"\"url\"" )
        title.removeFirst(1)
        title.removeLast(7)
        var thumbnailUrl = data.slice(from: "url", to: "thumbnailUrl")
        thumbnailUrl.removeFirst(4)
        thumbnailUrl.removeLast(8)
        titles.append(title)
        imagesURL.append(thumbnailUrl)
        
    }
    print(titles[22])
    print(imagesURL[22])
}


extension String {
    
    func slice(from: String, to: String) -> String {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
            }!
    }
}
