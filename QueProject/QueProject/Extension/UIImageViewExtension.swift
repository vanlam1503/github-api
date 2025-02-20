//
//  UIImageViewExtension.swift
//  QueProject
//
//  Created by TrongQue on 20/2/25.
//

import Alamofire
import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    print("Error: Unable to create image from data")
                }
            case .failure(let error):
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
}
