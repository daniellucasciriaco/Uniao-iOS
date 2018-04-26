//
//  LinhasViewController.swift
//  Viacao Uniao
//
//  Created by Daniel on 27/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import UIKit

class LinhasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    // MARK: Property(ies)
    
    var linhaItems: [Linha] = [Linha]()
    
    // MARK: IBOutlet(s)
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
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
        self.table.isHidden = true
        self.indicatorView.startAnimating()
        self.load()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableView Delegate(s)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return linhaItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: LinhaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LinhaTableViewCell
        
        cell.descriptionCell.text = linhaItems[indexPath.row].Nome
        cell.linha = linhaItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let obj: LinhaDetailViewController = storyboard?.instantiateViewController(withIdentifier: "LinhaDetail") as! LinhaDetailViewController
        obj.linha = self.linhaItems[indexPath.row]
        self.navigationController?.pushViewController(obj, animated: true)
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
        self.navigationItem.titleView = Util.sharedInstance.setTitle(title: "Linhas")
        
        let itemLeft = Util.sharedInstance.getBarButtonItem(target: self, image: "icMenu.png", method: "openMenu", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        let itemRight = Util.sharedInstance.getBarButtonItem(target: self, image: "icSearch.png", method: "openSearch", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        self.navigationItem.leftBarButtonItem = itemLeft
        self.navigationItem.rightBarButtonItem = itemRight
    }
    
    func load()
    {
        let refLinhas = LinhaController.sharedInstance.databaseRef.child("Linha")
        refLinhas.observeSingleEvent(of: .value, with: { (snapshot) in
            let postDict = snapshot.value as! NSDictionary
            self.linhaItems = LinhaController.sharedInstance.getAllLinhas(item: postDict)
            self.table.reloadData()
            self.table.isHidden = false
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden = true
        })
    }
    
    func openMenu()
    {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func openSearch()
    {
        print("Search")
    }

}

public class LinhaTableViewCell: UITableViewCell
{
    //MARK: IBOutlet(s)
    @IBOutlet weak var descriptionCell: UILabel!
    var linha: Linha?
}
