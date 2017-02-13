//
//  NetworkAdapter.swift
//  Yasaka-Kanako
//
//  Created by txx on 11/02/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class NetworkAdapter {
    
    public static let adapter = NetworkAdapter()
    
    func getDobanTop() {
        
        // Add URL parameters
        let urlParams = [
            "c":"MovieClub",
            "a":"DouBanTop",
            "kb":"1",
            ]
        
        // Fetch Request
        Alamofire.request("http://www.videozaixian.com/flex/index.php", method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseString { response in
                if (response.result.error == nil) {
                    if let html = response.result.value, let doc = HTML(html: html, encoding: .utf8) {
                        
                        for item in doc.xpath("//ul[@class='flexbox']//li") {
                            let info = MovieInfo()
                            info.director = item.at_xpath("a/div/article/p")?.text
                            info.name = item.at_xpath("a//span")?.text
                            info.thumbImage = item.at_xpath("a//img")?["datasrc"]
                            info.score = item.at_xpath("a//div[@class='score']/em")?.text
                            info.url = item.at_xpath("a")?["href"]
                            print(info)
                        }
                    }
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
            }
                
    }
    
}
