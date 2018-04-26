//
//  LinhaDetailViewController.swift
//  Viacao Uniao
//
//  Created by Daniel on 27/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import UIKit

class LinhaDetailViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    
    // MARK: Property(ies)
    
    var linha: Linha = Linha()
    
    // MARK: IBOutlet(s)
    @IBOutlet weak var linhaName: UILabel!
    @IBOutlet weak var tableItinerario: UITableView!
    @IBOutlet weak var tableTime: UITableView!
    @IBOutlet weak var viewHorario: UIView!
    @IBOutlet weak var viewTrajeto: UIView!
    
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
        self.linhaName.text = linha.Nome
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableView Delegate(s)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == tableItinerario)
        {
            return linha.TrajetoLinha.count
        }
        else
        {
            return linha.HorariosLinha.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (tableView == tableItinerario)
        {
            let cell: ItinerarioTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellTrajeto", for: indexPath) as! ItinerarioTableViewCell
            
            cell.cellDescription.text = linha.TrajetoLinha[indexPath.row].Rua
            
            return cell
        }
        else
        {
            let cell: HorarioTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellHorario", for: indexPath) as! HorarioTableViewCell
            
            cell.cellDescription.text = linha.HorariosLinha[indexPath.row].Horario
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
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
        
        let itemLeft = Util.sharedInstance.getBarButtonItem(target: self, image: "BackButton.png", method: "back", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        let itemRight = Util.sharedInstance.getBarButtonItem(target: self, image: "SearchPoint.png", method: "openPontos", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        self.navigationItem.leftBarButtonItem = itemLeft
        self.navigationItem.rightBarButtonItem = itemRight
        
        viewHorario.layer.borderWidth = 3
        viewHorario.layer.borderColor = UIColor.init(red: 49/255, green: 74/255, blue: 151/255, alpha: 1).cgColor
        viewHorario.layer.cornerRadius = 5
        viewHorario.clipsToBounds = true
        
        viewTrajeto.layer.borderWidth = 3
        viewTrajeto.layer.borderColor = UIColor.init(red: 49/255, green: 74/255, blue: 151/255, alpha: 1).cgColor
        viewTrajeto.layer.cornerRadius = 5
        viewTrajeto.clipsToBounds = true
    }
    
    func back()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func openPontos()
    {
        print("Pontos")
    }
    
}

public class ItinerarioTableViewCell: UITableViewCell
{
    //MARK: IBOutlet(s)
    @IBOutlet weak var cellDescription: UILabel!
}

public class HorarioTableViewCell: UITableViewCell
{
    //MARK: IBOutlet(s)
    @IBOutlet weak var cellDescription: UILabel!
}
