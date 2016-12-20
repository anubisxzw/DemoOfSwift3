//
//  PushListController.swift
//  DemoOfSwift3
//
//  Created by 许之午 on 2016/12/19.
//  Copyright © 2016年 许之午. All rights reserved.
//

import UIKit
import CoreData

class PushListController: UITableViewController {
    
    let cellIdentifier = "cellIdentifier"
    let cellName = "PushMessageCell"
    var messageData: [Messages] = []
    
    override func loadView() {
        let view = UINib(nibName: "PushListController", bundle: nil).instantiate(withOwner: self, options: nil).first
        if (view != nil) {
            self.view = view as! UIView!
        }
    }
    
    override func viewDidLoad() {
        
//        self.delMessages()
//        self.storeMessage(title: "title1", subtitle: "subTitle1")
//        self.storeMessage(title: "title2", subtitle: "subTitle2")
//        self.storeMessage(title: "title3", subtitle: "subTitle3")
//        self.storeMessage(title: "title4", subtitle: "subTitle4")
//        self.storeMessage(title: "title5", subtitle: "subTitle5")
        
        
        // レギストセル
        registCells()
        
        // プッシュのメッセージを取得する
        messageData = getMessages()
        
    }
    
    func storeMessage(title:String, subtitle:String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Messages", in: context)
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(title, forKey: "title")
        person.setValue(subtitle, forKey: "subtitle")
        
        do {
            try context.save()
        }catch{
            print(error)
        }
    }
    
    func getMessages() -> [Messages] {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        var searchResults: [Messages] = []
        
        do {
            searchResults = try context.fetch(fetchRequest) as! [Messages]
            print("numbers of \(searchResults.count)")
        } catch  {
            print(error)
        }
        
        return searchResults
    }
    
    func delMessages(){
        let context = getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages")
        
        do{
            let rels = try context.fetch(request) as! [Messages]
            for rel in rels{
                context.delete(rel)
            }
            try context.save()
        }catch{
            print(error)
        }
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            return appDelegate.persistentContainer.viewContext
        } else {
            return appDelegate.managedObjectContext
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // レギストセル
    func registCells() {
        let style1Cell = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(style1Cell, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messageData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PushMessageCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PushMessageCell
        
        cell.title = messageData[indexPath.row].title!
        cell.subTitle = messageData[indexPath.row].subtitle!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
