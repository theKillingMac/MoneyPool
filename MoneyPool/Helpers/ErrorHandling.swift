//
//  ErrorHandling.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

/// This struct provide basic error handling
struct ErrorHandling {
    
    private static let title = "Error"
    private static let okButtonTitle = "OK"
    private static let message = "Something unexpected happened, sorry for that!"
    
    /// Present a Alert on the topmost view controller
    static func defaultErrorHandler(error: NSError) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: okButtonTitle, style: .Default, handler: nil))
        
        // get reference for the topmost view controller
        let viewController = UIApplication.sharedApplication().windows[0].window?.rootViewController
        viewController?.presentViewController(alert, animated: true, completion: nil)
    }
}
