//
//  ViewController.swift
//  Viacao Uniao
//
//  Created by Daniel on 11/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    
    // MARK: Property(ies)
    
    var locationManager = CLLocationManager()
    var pinUser: PinAnnotationUser!
    var pinsFrota: [PinAnnotationFrota] = [PinAnnotationFrota]()
    
    // MARK: IBOutlet(s)
    
    @IBOutlet weak var mapView: MKMapView!

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
        
        // Define the menus
        let menuLeftNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // Customize components
        self.customize()
        
        // Map Method(s)
        self.initMapUserLocation()
        
        // Firebase Method(s)
        self.initObserverFrotas()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: MKMapView Delegate(s)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let userLocation: CLLocation = locations.last!
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        
        pinUser.coordinate = location
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let annotationView: MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        if annotation is PinAnnotationUser
        {
            annotationView.image = (annotation as! PinAnnotationUser).image
        }
        else if annotation is PinAnnotationFrota
        {
            annotationView.image = (annotation as! PinAnnotationFrota).image
        }
        
        annotationView.frame.size.width = 70
        annotationView.frame.size.height = 70
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if view.annotation! is PinAnnotationUser
        {
            print("User")
        }
        else if view.annotation! is PinAnnotationFrota
        {
            print("Ônibus")
        }
    }
    
    // MARK: Map Method(s)
    
    func initMapUserLocation()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!)
        let visualization: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, visualization)
        mapView.setRegion(region, animated: true)
        
        pinUser = PinAnnotationUser(coordinate: location, image: UIImage(named: "PinUser.png")!)
        
        mapView!.addAnnotation(pinUser)
    }
    
    func initObserverFrotas()
    {
        let refFrotas = FrotaController.sharedInstance.databaseRef.child("Frota")
        refFrotas.observe(.value, with: { (snapshot) in
            let postDict = snapshot.value as! NSDictionary
            
            let frotas: [Frota] = FrotaController.sharedInstance.getAllFrotas(item: postDict)
            
            if(self.pinsFrota.count != 0)
            {
                self.mapView.removeAnnotations(self.pinsFrota)
                self.pinsFrota.removeAll()
            }
            
            for item in frotas
            {
                let latitude: CLLocationDegrees = Double(item.Latitude)!
                let longitude: CLLocationDegrees = Double(item.Longitude)!
                
                let location:  CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let pin = PinAnnotationFrota(coordinate: location, image: UIImage(named: "PinBus.png")!, linha: item.LinhaFrota)
                self.pinsFrota.append(pin)
            }
            
            for item in self.pinsFrota
            {
                self.mapView.addAnnotation(item)
            }
            
        })
    }
    
    // MARK: Other Method(s)
    
    func customize()
    {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 251/255, green: 216/255, blue: 28/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 49/255, green: 74/255, blue: 151/255, alpha: 1)
        self.navigationItem.titleView = Util.sharedInstance.setTitle(title: "Mapa")
        
        let itemLeft = Util.sharedInstance.getBarButtonItem(target: self, image: "icMenu.png", method: "openMenu", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        let itemRight = Util.sharedInstance.getBarButtonItem(target: self, image: "icSearch.png", method: "openSearch", size: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        self.navigationItem.leftBarButtonItem = itemLeft
        self.navigationItem.rightBarButtonItem = itemRight
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

class PinAnnotationUser: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var image: UIImage
    
    init(coordinate: CLLocationCoordinate2D, image: UIImage)
    {
        self.coordinate = coordinate
        self.image = image
    }
}

class PinAnnotationFrota: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var image: UIImage
    var linha: String
    
    init(coordinate: CLLocationCoordinate2D, image: UIImage, linha: String)
    {
        self.coordinate = coordinate
        self.image = image
        self.linha = linha
    }
}
