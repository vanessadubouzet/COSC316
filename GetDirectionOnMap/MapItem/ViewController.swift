//
//  ViewController.swift
//  MapItem
//
//

import UIKit
import Contacts
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    var coords: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getDirections(_ sender: Any) {
        if let addressString = address.text,
            let cityString = city.text,
            let stateString = state.text,
            let zipString = zip.text {
            
            let addressString = "\(addressString) \(cityString) \(stateString) \(zipString)"
            
            CLGeocoder().geocodeAddressString(addressString,
                                completionHandler:{(placemarks, error) in
                if error != nil {
                        print("Geocode failed: \(error!.localizedDescription)")
                }
                else if let marks = placemarks, marks.count > 0 {
                        let placemark = marks[0]
                        if let location = placemark.location {
                            self.coords = location.coordinate
                            self.showMap()
                        }
                }
            })
           }
    }
    
    func showMap() {
        
        if let addressString = address.text,
            let cityString = city.text,
            let stateString = state.text,
            let zipString = zip.text,
            let coordinates = coords {
            
            let addressDict =
                [CNPostalAddressStreetKey: addressString,
                 CNPostalAddressCityKey: cityString,
                 CNPostalAddressStateKey: stateString,
                 CNPostalAddressPostalCodeKey: zipString]
            
            let place = MKPlacemark(coordinate: coordinates,
                                    addressDictionary: addressDict)
            
            let mapItem = MKMapItem(placemark: place)
            
            let options = [MKLaunchOptionsDirectionsModeKey:
                MKLaunchOptionsDirectionsModeDriving]
            
            mapItem.openInMaps(launchOptions: options)
        }
    }
    
}

