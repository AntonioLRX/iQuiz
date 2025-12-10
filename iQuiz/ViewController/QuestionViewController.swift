//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/10/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    private var questions: [Question] = []
    var ponts: Int = 0
    var numberQuestion: Int = 0
    var categoryId: Int = 0
    var difficult: DifficultEnum = .EASY
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var titleQuestionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = QuestionViewModel()
    
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
        configViewModel()
        viewModel.loadQuestions(
            categoryId: categoryId, difficult: difficult
        )
        // Do any additional setup after loading the view.
    }
    
    private func getCurrentQuestion() -> Question? {
        guard numberQuestion < questions.count else { return nil }
        return questions[numberQuestion]
    }
    
    func configViewModel() {
        // 1. O Callback (Listener) que é chamado quando o estado muda
        viewModel.onUpdate = { [weak self] in
            self?.render() // Chama a função que reage à mudança de estado
        }
    }
    
    // Essa função será a responsável por atualizar toda a UI com base no estado.
    func render() {
        // **A - Primeiro, esconde todos os elementos de estado (como um "reset")**
        self.activityIndicator.stopAnimating()
        //self.errorLabel.isHidden = true
        self.titleQuestionLabel.isHidden = true
        self.buttons.forEach { $0.isHidden = true }
        
        // **B - Reage ao estado atual**
        switch viewModel.state {
            
        case .initial:
            // Acontece antes de carregar
            break
            
        case .loading:
            // Mostra o spinner
            self.activityIndicator.startAnimating()
            
        case .success(let questions):
            self.questions = questions
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
            if questions.isEmpty {
                // Se a lista veio vazia (erro na API, mas sem throw)
                //self.errorLabel.text = "Nenhuma pergunta encontrada para esta categoria."
                //self.errorLabel.isHidden = false
            } else {
                self.titleQuestionLabel.isHidden = false
                self.buttons.forEach { $0.isHidden = false }
                self.configQuestion()
            }
            
        case .error(let message):
            print(message)
            // Ocorreu um erro
            //self.errorLabel.text = message
            //self.errorLabel.isHidden = false
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
        titleQuestionLabel.text = questions[numberQuestion].title
        for button in buttons {
            let titleButton = questions[numberQuestion].allAnswers[button.tag]
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
        let correct = questions[numberQuestion].correctAnswer == sender.titleLabel?.text
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
