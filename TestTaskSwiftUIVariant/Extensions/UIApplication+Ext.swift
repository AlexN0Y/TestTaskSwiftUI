//
//  UIApplication+Ext.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import UIKit

extension UIApplication {
    
    var topViewController: UIViewController? {
        let windowScenes = connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        return windowScenes.first?.windows
            .first { $0.isKeyWindow }?
            .rootViewController?
            .topViewController
    }
}
