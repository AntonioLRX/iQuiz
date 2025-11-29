//
//  DataSourceMock.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 28/11/25.
//

import Foundation


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


let categories: [Category] = [
    Category(id: 1, name: "Ficção Científica"),
    Category(id: 2, name: "Entretenimento"),
    Category(id: 3, name: "Esportes"),
    Category(id: 4, name: "Tipos de queijos"),
    Category(id: 5, name: "Jogos de tabuleiro"),
]


let questionsMock: [Question] = questions
let categoriesMock: [Category] = categories
