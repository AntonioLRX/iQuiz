//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/10/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var ponts: Int = 0
    var numberQuestion: Int = 0
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var titleQuestionLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        validateAnswer(sender)
        
        if numberQuestion < questions.count - 1 {
            numberQuestion += 1
            //Utilizado pra add intervalo de algo #selector é pra colocar a funcao que vai ser executada apos o intervalo
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configQuestion), userInfo: nil, repeats: false)
        } else {
            navigateToPerformanceScreen()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
        configQuestion()
        // Do any additional setup after loading the view.
    }
    
    
    func configLayout() {
        navigationItem.hidesBackButton = true
        titleQuestionLabel.numberOfLines = 0
        titleQuestionLabel.textAlignment = .center
        for button in buttons {
            button.layer.cornerRadius = 12.0
        }
    }
    
    //objsc usado pos causa do selector
    @objc func configQuestion() {
        titleQuestionLabel.text = questions[numberQuestion].title
        for button in buttons {
            let titleButton = questions[numberQuestion].answers[button.tag]
            button.setTitle(titleButton, for: .normal)
            button.backgroundColor = UIColor.customColor
        }
    }
    
    func navigateToPerformanceScreen() {
        performSegue(withIdentifier: "goToPerformanceScreen", sender: nil)
    }
    
    //segue é uma transicao entre telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let performanceVC = segue.destination as? PerformanceViewController else { return }
        performanceVC.ponts = ponts
    }
    
    func validateAnswer(_ sender: UIButton) {
        let correct = questions[numberQuestion].correctAnswer == sender.tag
        if(correct) {
            ponts += 1
            sender.backgroundColor = UIColor.greenBackground
        } else {
            sender.backgroundColor = UIColor.redBackground
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
