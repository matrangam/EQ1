//
//  ViewController.swift
//  EarthQuake
//
//  Created by Michael Matranga on 9/27/14.
//  Copyright (c) 2014 Michael Matranga. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "http://http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_hour.geojson")
                 .responseJSON {(request, response, JSON, error) in
                     println(JSON)
                 }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

