//
//  UIImageViewExtension.swift
//  HaProject
//
//  Created by Ha on 20/2/25.
//

import Alamofire
import UIKit

extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let cacheKey = urlString as NSString
        if let cachedImage = UIImageView.imageCache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        AF.request(url).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    UIImageView.imageCache.setObject(image, forKey: cacheKey)
                    
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
