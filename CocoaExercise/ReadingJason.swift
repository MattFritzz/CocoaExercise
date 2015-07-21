//
//  ReadingJason.swift
//  CocoaExercise
//
//  Created by iOS on 7/20/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation

func jsonToDictionary() -> [NSDictionary] {
    let masterDataUrl: NSURL = NSBundle.mainBundle().URLForResource("new-pods", withExtension: "json")!
    let jsonData: NSData = NSData(contentsOfURL: masterDataUrl)!
    let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as! NSDictionary
    
    let d = jsonResult.objectForKey("responseData")?.objectForKey("feed") as? NSDictionary
    let e = d?["entries"] as? [NSDictionary]
    
    return e!
}

func entriesFromDictionary(json: [NSDictionary]) -> [Entry] {
    var entries: [Entry] = []
    
    for j in json {
        if let entry = Entry.decode(j) {
            entries.append(entry)
        }
    }
    
    return entries
}

