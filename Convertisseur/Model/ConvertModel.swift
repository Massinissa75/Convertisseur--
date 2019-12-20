//
//  ConvertModel.swift
//  Convertisseur
//
//  Created by Massinissa.R on 04/12/2019.
//  Copyright © 2019 Massinissa. All rights reserved.
//

import Foundation

/*class Convert {
  
  static var shared = Convert()
 // private init () {}
  
  private static let apiUrlString = "http://data.fixer.io/api/latest"
 // private let apiKey =
  let apiUrl = URL(string: apiUrlString)
  
  private var task: URLSessionDataTask?
  
  func convertMoney() {
    let completUrl = apiUrl! (\(apiUrl!)?access_key=\(accessKey))
    let session = URLSession(configuration: .default)
    let request = URLRequest(url: completUrl)
    
  }
  */
  
  
  class Convert {
    var firstAmountToConvert = 0.0
    private static let apiUrlString = "http://data.fixer.io/api/latest"
    let apiKey = "?access_key=34f12e438657827416158c23365fb332"
    let apiUrl = URL(string: apiUrlString)
    private var task: URLSessionDataTask?

func getConvert(callback: @escaping (Bool, Services?) -> Void) {
    let completUrl = "\(apiUrl!)\(apiKey)&base=EUR&symbols=USD"
    let request = URLRequest(url: URL(string: completUrl)!)
    let session = URLSession(configuration: .default)
    task?.cancel()
    task = session.dataTask(with: request) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data, error == nil else {
          return callback(false, nil)
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          return callback(false, nil)
        }
       do {
         let change = try? JSONDecoder().decode(Services?.self, from: data)
                 callback(true, change)
    // } catch {
    //   callback(false, nil)
       }
    }
  }
      self.task?.resume()
  }
  
}














    
   /* func getConvert(callback: @escaping (Bool, Rates) -> Void) {
      let completUrl = "\(apiUrl!)\(apiKey)"
      let request = URLRequest(url: URL(string: completUrl)!)
      let session = URLSession(configuration: .default)
      task?.cancel()
      task = session.dataTask(with: request) { (data, response, error) in
        DispatchQueue.main.async {
       /* print(response as Any)
          if let data = data, error == nil {
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200  {
            }
          }
        }
      }
      task?.resume()
    }*/
          
        
          }
          guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            return callback(false, nil)

          }
          print(response)

          
          do {
              let change = try? JSONDecoder().decode(Rates.self, from: data)
            callback(true, change)
            print(response)
          } catch {
              callback(false, nil)
          }
        }
       self.task?.resume()
      
    }*/

