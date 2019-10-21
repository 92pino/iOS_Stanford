//
//  ViewController.swift
//  Concentration
//
//  Created by JinBae Jeong on 2019/09/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // private이 필요한 이유 : 게임 내에서 카드 쌍의 개수는 UI와 직접적인 관련이 있기 때문
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        // set이 없을 경우 get 명시 없이 바로 return
        return (cardButtons.count+1) / 2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    
    // 아울렛의 경우 거의 비공개
    // --> UI의 내부 구현 방식의 일종이기 때문
    // --> 뷰 컨트롤러가 UI를 제어하는 방식이기 때문
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : .orange
            }
        }
    }
    
    private var emojiChoices: [String] = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮",]
    
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            // arc4random_uniform : 유사 임의 번호 생성기
                emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return -0
        }
    }
}
