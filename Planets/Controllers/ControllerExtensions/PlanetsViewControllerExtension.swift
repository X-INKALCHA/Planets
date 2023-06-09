//
//  PlanetsViewControllerExtension.swift
//  Planets
//
//  Created by SravsRamesh on 08/06/23.
//

import Foundation
import UIKit

extension PlanetsViewController : UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetViewCell") as! PlanetViewCell

        let planet = self.planets![indexPath.row]
        cell.lblPlanetName.text = planet.name

        return cell
    }
}
