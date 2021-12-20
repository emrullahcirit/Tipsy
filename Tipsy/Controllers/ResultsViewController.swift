//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Muhammed Emrullah Cirit on 19.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBillPerPerson: String?
    var tipTitle: String?
    var totalPeople: Int?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalBillPerPerson
        settingsLabel.text = "Split between \(totalPeople ?? 0) people, with \(tipTitle ?? "0") tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
