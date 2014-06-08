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
}