//
//  ViewController.swift
//  Scroll Image
//
//  Created by Aleksandr Bychkovskiy on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let timeToScroll: Double = 5
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "longImg")
        return iv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
        let imageHeight = imageView.image?.size.height ?? 0
        
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.frame.width,
                                 height: imageHeight)
        
        
        scrollToBottom()
    }
    
    
    private func scrollToBottom() {
        let deltaHeight = imageView.frame.height - view.frame.height
        
        UIView.animate(withDuration: timeToScroll,
                       animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -deltaHeight)
        }) { _ in
            self.scrollToTop()
        }
    }
    
    private func scrollToTop() {
        UIView.animate(withDuration: timeToScroll,
                       animations: {
            self.imageView.transform = .identity
        }) { _ in
            self.scrollToBottom()
        }
    }
    
}
