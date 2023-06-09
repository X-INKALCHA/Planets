//
//  PlanetsViewController.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import UIKit

class PlanetsViewController: UIViewController {

    var planets : Array<Planet>? = nil
    private let planetViewModel = PlanetViewModel()

    @IBOutlet weak var tblPlanet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        planetViewModel.getPlanetRecord {[weak self] planetRecords in
            DispatchQueue.main.async {
                if(planetRecords != nil && planetRecords?.count != 0){
                    self?.planets = planetRecords
                    self?.tblPlanet.reloadData()
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
