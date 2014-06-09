//
//  TrainOperationController.swift
//  RunningTrain
//
//  Created by Kip on 6/9/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import Foundation

var TOCInstance : TrainOperationController? = nil;

class TrainOperationNetClient : NSObject
{
    var baseURL : String
    {
        return ""
    }
    
    func generateOperation(url: String, params params: Dictionary<String, String>?, success success: ((AFHTTPRequestOperation!, AnyObject!) -> Void)?, failure failure: ((AFHTTPRequestOperation!, NSError!) -> Void)?) -> AFHTTPRequestOperation
    {
        var szRequest = "\(baseURL)/\(url)"
        if let unwrappedParams = params
        {
            szRequest += "/"
            for (argName, argValue) in unwrappedParams
            {
                szRequest += "?\(argName)=\(argValue)"
            }
        }
        
        let url = NSURL(string: szRequest)
        let request = NSURLRequest(URL: url)
        let operation = AFHTTPRequestOperation(request: request)
        operation.responseSerializer = ((AFJSONResponseSerializer(readingOptions: NSJSONReadingOptions.AllowFragments)) as AFHTTPResponseSerializer)
        operation.setCompletionBlockWithSuccess(success, failure: failure)
        operation.start()
        return operation
    }
    
    class SeptaClient : TrainOperationNetClient
    {
        override var baseURL : String
        {
            return "http://www3.septa.org/hackathon"
        }
    }
}
class TrainOperationController : NSObject
{
    let septaClient = TrainOperationNetClient.SeptaClient();
    
    class func sharedController() -> TrainOperationController
    {
        var token : dispatch_once_t = 0
        dispatch_once(&token, {
            TOCInstance = TrainOperationController();
        })
        return TOCInstance!;
    }
}