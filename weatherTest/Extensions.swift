//
//  Extensions.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 17/06/22.
//

import UIKit

extension UIApplication {

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
