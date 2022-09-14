//
//  MapVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 13.09.22.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    var user: User?
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    

    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            showLocation()
        } else {
            showAlert()
        }
        
    }
    
    
    func showLocation() {
        guard let lat = Double((user?.address?.geo?.lat)!),
              let lng = Double((user?.address?.geo?.lng)!) else { return }
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        mapView.addAnnotation(annontation)
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        mapView.setRegion(region, animated: true)
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Your location service is turned off", message: "want on?", preferredStyle: .alert)
        
        let settingAction = UIAlertAction(title: "Settings", style: .default) { alert in
            if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") {
                UIApplication.shared.open(url)
            }
        }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}
