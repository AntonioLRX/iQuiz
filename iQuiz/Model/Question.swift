//
//  Untitled.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 30/10/25.
//

import Foundation

struct Question {
    var title: String
    var answers: [String]
    var correctAnswer: Int
}

let questions: [Question] = [
    
    Question(
        title: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
        answers: [
            "Expecto Patronum",
            "Avada Kedavra",
            "Expelliarmus",
        ],
        correctAnswer: 2
    ),
    Question(
        title: "Em que ano Vingadores Ultimato foi lançado?",
        answers: [
            "2019",
            "2018",
            "2017",
        ],
        correctAnswer: 0
    ),
    Question(
        title: "Em que ano Avatar 2 foi lançado?",
        answers: [
            "2014",
            "2022",
            "2023",
        ],
        correctAnswer: 1
    ),
    Question(
        title: "Qual é o primeiro filme da franquia Star Wars?",
        answers: [
            "Star Wars: A Ameaça Fantasma",
            "Star Wars: Uma Nova Esperança",
            "Star Wars: O Império Contra-Ataca",
        ],
        correctAnswer: 1
    ),
    Question(
        title: "Qual é o primeiro filme do Universo Cinematográfico Marvel (MCU)?",
        answers: [
            "Homem de Ferro",
            "Capitão América: O Primeiro Vingador",
            "Thor",
        ],
        correctAnswer: 0
    ),
    Question(
        title: "Qual é o trabalho de Jay Pritchett na série Modern Family?",
        answers: [
            "Médico",
            "Empresário",
            "Advogado",
        ],
        correctAnswer: 1
    ),
    Question(
        title: "Qual é o personagem principal de The Office, interpretado por Steve Carell?",
        answers: [
            "Michael Scott",
            "Jim Halpert",
            "Dwight Schrute",
        ],
        correctAnswer: 0
    )
    
]
