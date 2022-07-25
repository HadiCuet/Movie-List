//
//  UIImageView+Extension.swift
//  Movie List
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(fromUrl url: URL) {
        if let cachedImage = imageCache.object(forKey: url as AnyObject) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: url as AnyObject)
                    self?.image = image
                }
            }
        }
    }
}
