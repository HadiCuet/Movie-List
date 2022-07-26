//
//  Extensions.swift
//  Movie List
//

import Foundation
import UIKit

//MARK: ImageView extensions
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

//MARK: String extensions
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        return ceil(boundingBox.height)
    }
}

//MARK: UIActivityIndicatorView extensions
extension UIActivityIndicatorView {
    func dismissLoader(view: UIView) {
        self.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
