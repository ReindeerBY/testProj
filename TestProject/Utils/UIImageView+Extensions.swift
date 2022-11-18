//
//  UIImageView+Extensions.swift
//  TestProject
//
//  Created by Evgeniy on 16.11.22.
//

import UIKit

extension UIImageView {

    func imageFromURL(_ urlString: String) {

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, _) -> Void in

            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })

        }).resume()
    }
}

