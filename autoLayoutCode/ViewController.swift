//
//  ViewController.swift
//  autoLayoutCode
//
//  Created by Toerk Egeberg on 29/08/2019.
//  Copyright © 2019 Toerk Egeberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!
    
    let redViewProg = UIView()
    var yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    func setupConstraints() {
        self.yellowView = UIView(frame: CGRect(x: self.view.center.x - 50, y: self.view.center.y, width: 100, height: 100))
        self.view.addSubview(yellowView)
        self.view.addSubview(redViewProg)
        
        self.redViewProg.translatesAutoresizingMaskIntoConstraints = false
        redViewProg.backgroundColor = UIColor.red
        let redtop = NSLayoutConstraint(item: self.redViewProg, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 16)
        let readLeading = NSLayoutConstraint(item: self.redViewProg, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 16)
        let readHeight = NSLayoutConstraint(item: self.redViewProg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
        let readWidth = NSLayoutConstraint(item: self.redViewProg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 200)
        self.view.addConstraints([redtop, readLeading, readHeight, readWidth])
        

        greenView.translatesAutoresizingMaskIntoConstraints = false
        let greenCenterX = NSLayoutConstraint(item: greenView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 1)
        let greenTop = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: yellowView, attribute: .bottom, multiplier: 1, constant: 50)
        let greenHeight = NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
        let greenWidth = NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 200)
        self.view.addConstraints([greenCenterX, greenTop, greenHeight, greenWidth])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.yellowView.center.x -= self.view.bounds.width
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseInOut], animations: {
            self.yellowView.backgroundColor = UIColor.blue
            self.yellowView.center.x += self.view.bounds.width
        }) { _ in
            self.yellowView.translatesAutoresizingMaskIntoConstraints = false
            let yellowCenterX = NSLayoutConstraint(item: self.yellowView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 1)
            let yellowCenterY = NSLayoutConstraint(item: self.yellowView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 1)
            let yellowHeight = NSLayoutConstraint(item: self.yellowView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
            let yellowWidth = NSLayoutConstraint(item: self.yellowView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 200)
            self.view.addConstraints([yellowCenterX, yellowCenterY, yellowHeight, yellowWidth])
            
        }
    }
    
}

