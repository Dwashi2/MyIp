//
//  MyIpApiManager.swift
//  MyIp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import Foundation

protocol MyIpApiManagerDelegate: AnyObject {
    func checkIP(_ IpManager: MyIpApiManager, ip: MyIpData)
    func didFailWithError(error: Error)
}

struct MyIpApiManager {
    let apiURL = Constants.url
    
    weak var delegate: MyIpApiManagerDelegate?
    
    func perforRequest() {
        //MARK: - 1. Create a url
        if let url = URL(string: apiURL) {
            
            //MARK: - 2. Create a urlsession
            let session = URLSession(configuration: .default)
            
            //MARK: - 3. Give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let myIpData = parseJSON(safeData){
                        delegate?.checkIP(self, ip: myIpData)
                    }
                }
            }
            //MARK: - 4. Start the task
            task.resume()
        }
    }
        
        
    func parseJSON(_ myIpData: Data) -> MyIpData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MyIpData.self, from: myIpData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
