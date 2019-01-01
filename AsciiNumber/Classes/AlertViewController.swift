//
//  AlertViewController.swift
//  myUI+AR
//
//  Created by Tse Jun Zhen on 25/12/2018.
//  Copyright © 2018 TseJunZhen. All rights reserved.
//

import UIKit
class AlertViewController: UIViewController {

func alertView(message: String) {
    var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    topWindow?.rootViewController = UIViewController()
    topWindow?.windowLevel = UIWindow.Level.alert + 1
    let alert: UIAlertController =  UIAlertController(title: "Privacy", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action: UIAlertAction) -> Void in
        // continue your work
        
        // important to hide the window after work completed.
        // this also keeps a reference to the window until the action is invoked.
        topWindow?.isHidden = true // if you want to hide the topwindow then use this
        topWindow = nil // if you want to remove the topwindow then use this
    }))
    topWindow?.makeKeyAndVisible()
    topWindow?.rootViewController?.present(alert, animated: true, completion: nil)
}
}
