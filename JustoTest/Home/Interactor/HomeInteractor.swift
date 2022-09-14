//
//  HomeInteractor.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class  HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeOutputInteractorProtocol?
    
    func generateUser(from view: UIViewController) {
        let url = URL(string: "https://randomuser.me/api/")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode == 200 {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    DispatchQueue.main.async {
                        do {
                            if let data = data {
                                let userInfo = try JSONDecoder().decode(User.self, from: data)
                                self.presenter?.sendInfo(user: userInfo)
                            }
                        } catch let error {
                            print("error: \(error)")
                            self.presenter?.retry()
                        }
                    }
                    
                }
            } else {
                self.presenter?.retry()
            }
        }).resume()
    }
}
