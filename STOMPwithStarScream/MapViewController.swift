//
//  MapViewController.swift
//  STOMPwithStarScream
//
//  Created by Je.vinci.Inc on 2017. 7. 21..
//  Copyright © 2017년 Je.vinci.Inc. All rights reserved.
//

import UIKit
import GoogleMaps



let center: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.507, longitude: 127.052)
let cam = GMSCameraPosition.camera(withTarget: center, zoom: 16)
class MapViewController: UIViewController,Audible{
    var user : LocationUser!
    var mapView: GMSMapView = GMSMapView(frame: UIScreen.main.bounds)
    var marker1 = GMSMarker()
    var marker2 = GMSMarker()
    var marker3 = GMSMarker()
    var location: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = GMSMapView.map(withFrame: view.frame, camera: cam)
        view.addSubview(mapView)
        user = LocationUser()
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setup), userInfo: nil, repeats: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setup(){
        
    }
    func createMark(location: CLLocationCoordinate2D) -> GMSMarker{
        let mark = GMSMarker(position: location)
        mark.map = self.mapView
        return mark
    }
    func removemark(mark: GMSMarker){
        guard mark.map == nil else {
            mark.map = nil
            return
        }
    }
    func DoorBell(delivery: LocationUser) {
        let size = CGSize(width: 23, height: 30)
        let location = CLLocationCoordinate2D(latitude: delivery.latitude!, longitude: delivery.longitude!)
        if delivery.userId == 1001 {
            removemark(mark: marker1)
            self.marker1 = createMark(location: location)
            var image = UIImage(named:"redmark.png")
            image = image?.scaleImage(toSize: size)
            self.marker1.icon = image
        }else if delivery.userId == 2222{
            removemark(mark: marker2)
            self.marker2 = createMark(location: location)
            var image = UIImage(named:"bluemark.ico")
            image = image?.scaleImage(toSize: size)
            self.marker2.icon = image
        }else if delivery.userId == 3333{
            removemark(mark: marker3)
            self.marker3 = createMark(location: location)
            var image = UIImage(named:"greenmark.png")
            image = image?.scaleImage(toSize: size)
            self.marker3.icon = image
        }
//        createMark(location: location)
//        self.array.append(location)
    }
}
extension UIImage {
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(self.cgImage!, in: newRect)
            let newImage = UIImage(cgImage: context.makeImage()!)
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
}

