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
    
    private let viewModel = QuestionViewModel()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        validateAnswer(sender)
        
        if numberQuestion < viewModel.questions.count - 1 {
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
        configViewModel()
        viewModel.loadQuestions()
        // Do any additional setup after loading the view.
    }
    
    func configViewModel() {
        // Garante que a atualização da UI ocorra na thread principal
        viewModel.onUpdate = { [weak self] in
            // [weak self] para evitar retenção de ciclo
            guard let self = self else { return }
            
            // Verifica se há questões antes de tentar configurar a tela
            if self.viewModel.questions.isEmpty == false {
                self.configQuestion()
            }
        }
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
        titleQuestionLabel.text = viewModel.questions[numberQuestion].title
        for button in buttons {
            let titleButton = viewModel.questions[numberQuestion].allAnswers[button.tag]
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
        let correct = viewModel.questions[numberQuestion].correctAnswer == sender.titleLabel?.text
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
