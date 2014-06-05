//
//  Station.swift
//  RunningTrain
//
//  Created by Ryan Gilbert on 6/5/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import Foundation

class TrainStop : NSObject {
    let name : String
    let estimatedArrivalTime : NSDate
    var acutalArrivalTime : NSDate?

    init(name: String, estimatedArrivalTime: NSDate)
    {
        self.name = name
        self.estimatedArrivalTime = estimatedArrivalTime
        super.init()
    }
    convenience init(name: String, estimateArrivalTime: NSDate, actualArrivalTime: NSDate)
    {
        self.init(name: name, estimatedArrivalTime: actualArrivalTime)
        self.acutalArrivalTime = actualArrivalTime
    }
}