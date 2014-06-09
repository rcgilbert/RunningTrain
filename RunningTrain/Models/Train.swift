//
//  Train.swift
//  RunningTrain
//
//  Created by Ryan Gilbert on 6/5/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import Foundation

enum TimeStatus {
    case OnTime
    case Early(Int)
    case Late(Int)
}

class Train : NSObject {
    let name : String
    var status : TimeStatus = TimeStatus.OnTime;
    var routes : Route[]
    var currentRoute : Route? {
        return routes[routes.startIndex]
    }

    init(name: String, routes: Route[]) {
        self.routes = routes
        self.name = name
        super.init()
    }
    
    convenience init(septaData: NSDictionary)
    {
        let szService = septaData["service"] as NSString
        let szTrainNo = septaData["trainno"] as NSString
        let szSource = septaData["SOURCE"] as NSString
        let szDest = septaData["dest"] as NSString
        let szFullName = "\(szService) train \(szTrainNo) from \(szSource) to \(szDest)";
        self.init(name: szFullName, routes: [])
        let timeWhatever = septaData["late"] as Int
        if timeWhatever < 0
        {
            self.status = .Early(-timeWhatever)
        }
        else if timeWhatever > 0
        {
            self.status = .Late(timeWhatever)
        }
    }
    
}