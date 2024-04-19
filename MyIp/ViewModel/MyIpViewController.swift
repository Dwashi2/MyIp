//
//  MyIpViewController.swift
//  MyIp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import UIKit

class MyIpViewController: UIViewController {
    
    private lazy var contentView = MyIpView()
    private var myIpApiManager = MyIpApiManager()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        myIpApiManager.delegate = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callApi()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1.00)
    }
    
    func callApi(){
        myIpApiManager.perforRequest()
    }
}

//MARK: - MyIpApiManagerDelegate

extension MyIpViewController: MyIpApiManagerDelegate {
    func checkIP(_ IpManager: MyIpApiManager, ip: MyIpData) {
        DispatchQueue.main.async {
            self.contentView.ipTextLabel.text = ip.ip
            self.contentView.countryTextLabel.text = "\(ip.country ?? "") - \(ip.cc ?? "")"
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error.localizedDescription)
    }
    
    
}
