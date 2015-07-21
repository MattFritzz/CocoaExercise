//
//  ViewControllerTableView.swift
//  CocoaExercise
//
//  Created by iOS on 7/20/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewControllerTableView : UIViewController, UITableViewDataSource, UITableViewDelegate {
    let textosLabels = entriesFromDictionary(jsonToDictionary())
    let today = NSDate()
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    var favoritesIndex: [Int] = []
    
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.estimatedRowHeight = 90
        feedTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textosLabels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as! ViewTableViewCell
        cell.lblTitle.text = textosLabels[indexPath.row].title
        cell.lblContentSnippet.text = textosLabels[indexPath.row].contentSnippet
        cell.lblContentSnippet.numberOfLines = 0
        
        //pega a data atual
        if calendar!.compareDate(today, toDate: textosLabels[indexPath.row].publishedDate, toUnitGranularity: NSCalendarUnit.CalendarUnitDay) == NSComparisonResult.OrderedSame {
            cell.lblNew.hidden = false
        }
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        feedTableView.reloadSections(NSIndexPath(index: 1), withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        UIApplication.sharedApplication().openURL(textosLabels[indexPath.row].link)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var favoriteAction  = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Favorite" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! ViewTableViewCell
            cell.lblTitle.font = UIFont.boldSystemFontOfSize(16.8)
            cell.lblContentSnippet.font = UIFont.boldSystemFontOfSize(11.8)
        })
        return [favoriteAction]
    }
    
}
