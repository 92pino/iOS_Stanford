//
//  Concentration.swift
//  StackView_AutoLayout
//
//  Created by JinBae Jeong on 2020/09/01.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

class Concentration {
  var cards = [Card]()
  
  func chooseCard(at index: Int) {
    
  }
  
  init(numberOfPairsOfCards: Int) {
    // 시퀀스
    for _ in 1...numberOfPairsOfCards {
      let card = Card()
      cards += [card, card]
    }
    
    // TODO: Shuffle the cards
    cards.shuffle()
  }
}
