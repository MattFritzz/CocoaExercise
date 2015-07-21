//
//  Entry.swift
//  CocoaExercise
//
//  Created by iOS on 7/20/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

struct Entry {
    let title: String
    let publishedDate: NSDate
    let link: NSURL
    let contentSnippet: String
    let content: String
    
    
    // NSURL(string: "http://www.google.com")
    // NSDateFormatter
    static func decode(j: AnyObject?) -> Entry? {
        var dFormatter = NSDateFormatter()
        dFormatter.dateFormat = "EEE, d MMM yyyy HH:mm:ss Z"
        if let json = j as? NSDictionary,
            let title = json["title"] as? String,
                let date = json["publishedDate"] as? String,
                    let link = json["link"] as? String,
                        let cS = json["contentSnippet"] as? String,
                            let c = json["content"] as? String {
                                return Entry(title: title, publishedDate: dFormatter.dateFromString(date)!, link: NSURL(string: link)!, contentSnippet: cS.componentsSeparatedByString("\n")[0], content: c)
        }
        
        return nil
    }
    
}