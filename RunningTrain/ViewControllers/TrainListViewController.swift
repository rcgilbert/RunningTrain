//
//  TrainListViewController.swift
//  RunningTrain
//
//  Created by Elliott Kipper on 6/6/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import UIKit

class TrainListViewController: UITableViewController, UISplitViewControllerDelegate {

    var trains : Train[] = []
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        self.title = "Trains"
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "TrainCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "trainCell")
        self.tableView.estimatedRowHeight = 44.0 //Kip: This MUST be set for self-sizing cells to work reliably
        for i in 0..10
        {
            var name = "Shit train fart taint \(i)"
            if arc4random() % 3 == 0
            {
                name = "\(name) qwertyuiop asdka ksdlkajs a asl penis alkas"
            }
            let buttTrain = Train(name: name, routes: [])
            trains.append(buttTrain)
        }

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        getTestData()
    }
    
    func getTestData ()
    {        
        TrainOperationController.sharedController().septaClient.generateOperation("TrainView", params:nil, success:{(operation:AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
            self.trains.removeAll(keepCapacity: false)
            if let remoteTrains = responseObject as? NSArray
            {
                for poopTrain : AnyObject in remoteTrains
                {
                    let trainDic = poopTrain as NSDictionary
                    let tempTrain = Train(septaData: trainDic)
                    self.trains.append(tempTrain)
                }
            }
            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
            }, failure:{(operation:AFHTTPRequestOperation?, error:NSError?) -> Void in
                if let err = error
                {
                    println("\(err)")
                }
            })
    }
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return trains.count
    }

    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell?
    {
        if let cell : TrainCell = tableView?.dequeueReusableCellWithIdentifier("trainCell") as? TrainCell
        {
            if let thisTrain = trainForIndexPath(indexPath)
            {
                cell.updateWithTrain(thisTrain)
            }
            return cell
        }
        return nil;
    }


    func trainForIndexPath(indexPath:NSIndexPath) -> Train?
    {
        if trains.count >= indexPath.row
        {
            return trains[indexPath.row]
        }
        return nil;
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if let idxp = indexPath
            {
                trains.removeAtIndex(idxp.row)
                tableView.deleteRowsAtIndexPaths([idxp], withRowAnimation: UITableViewRowAnimation.Fade)

            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
