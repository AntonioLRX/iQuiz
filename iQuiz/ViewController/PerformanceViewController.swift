//
//  PerformanceViewController.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 31/10/25.
//

import UIKit

class PerformanceViewController: UIViewController {
    
    var ponts: Int?
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
        configPerfomance()

        // Do any additional setup after loading the view.
    }
    
    func configLayout() {
        buttonReset.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
    }
    
    func configPerfomance() {
        let totalQuestions = questions.count
        guard let ponts = ponts else { return }
        resultLabel.text = "Você acertou \(ponts) de \(totalQuestions) questões"
        let percent = calculateResultPercent(ponts, totalQuestions)
        percentLabel.text = "Percentual final: \(percent)%"
    }
    
    func calculateResultPercent(_ ponts: Int, _ totalQuestions: Int) -> String {
        let result = (ponts * 100) / totalQuestions
        return "\(result)"
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
