//
//  ViewController.swift
//  Project16
//
//  Created by MacBook Air on 21.11.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(changeMapView))
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let stavropol = Capital(title: "Stavropol", coordinate: CLLocationCoordinate2D(latitude: 45.0428, longitude: 41.9734), info: "The best city ever.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, stavropol])
    }
    
    @objc func changeMapView() {
        let ac = UIAlertController(title: "Map view change", message: "What view you prefer?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Satillete view", style: .default) { [ weak self ] action in
            self?.mapView.mapType = .satellite
        })
        ac.addAction(UIAlertAction(title: "Standard view", style: .default) { [ weak self ] action in
            self?.mapView.mapType = .standard
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }

        // 2
        let identifier = "Capital"

        // 3
    
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
  
        if annotationView == nil {
            //4
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .blue
            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
            annotationView?.pinTintColor = .blue
        }

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info

        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        ac.addAction(UIAlertAction(title: "Show wiki of capital", style: .default){ [weak self] action in
            let vc = DetailViewController()
            if capital.title == "London" {
                vc.url = "https://en.wikipedia.org/wiki/London"
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if capital.title == "Oslo" {
                vc.url = "https://en.wikipedia.org/wiki/Oslo"
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if capital.title == "Paris" {
                vc.url = "https://en.wikipedia.org/wiki/Paris"
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if capital.title == "Rome" {
                vc.url = "https://en.wikipedia.org/wiki/Rome"
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if capital.title == "Washington DC" {
                vc.url = "https://en.wikipedia.org/wiki/Washington,_D.C."
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if capital.title == "Stavropol" {
                vc.url = "https://en.wikipedia.org/wiki/Stavropol"
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        })
        present(ac, animated: true)
    }


}

