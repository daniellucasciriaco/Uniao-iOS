//
//  SideMenuViewController.swift
//  Viacao Uniao
//
//  Created by Daniel on 12/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    // MARK: Property(ies)
    
    var menuItems: [[String:String]] = [["icon":"icMap.png", "name":"Mapa"], ["icon":"icBus.png", "name":"Linhas"], ["icon":"icContactUs.png", "name":"Fale Conosco"]]
    
    // MARK: StatusBar Delegate(s) and Property(ies).
    
    override var prefersStatusBarHidden: Bool
    {
        get
        {
            return true
        }
    }
    
    // MARK: UIViewController Delegate(s)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.customize()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableView Delegate(s)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.imageCell.image = UIImage(named: menuItems[indexPath.row]["icon"]!)
        cell.descriptionCell.text = menuItems[indexPath.row]["name"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(indexPath.row == 0)
        {
            let obj: MainViewController = storyboard?.instantiateViewController(withIdentifier: "Main") as! MainViewController
            self.navigationController?.pushViewController(obj, animated: true)
        }
        if(indexPath.row == 1)
        {
            let obj: LinhasViewController = storyboard?.instantiateViewController(withIdentifier: "Linhas") as! LinhasViewController
            self.navigationController?.pushViewController(obj, animated: true)
        }
        if(indexPath.row == 2){}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44
    }
    
    // MARK: Method(s)
    
    func customize()
    {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 251/255, green: 216/255, blue: 28/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 49/255, green: 74/255, blue: 151/255, alpha: 1)
        self.navigationItem.titleView = Util.sharedInstance.setTitle(title: "Viação União")
    }
    
}

public class MenuTableViewCell: UITableViewCell
{
    //MARK: IBOutlet(s)
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var descriptionCell: UILabel!
    
}
