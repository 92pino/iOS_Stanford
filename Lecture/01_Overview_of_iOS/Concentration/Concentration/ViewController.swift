//
//  ViewController.swift
//  Concentration
//
//  Created by JinBae Jeong on 2019/09/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var emojiChoices: [String] = ["🎃", "👻", "🎃", "👻"]
  
  // 모든 인스턴스 변수(속성)은 초기화해야한다.
  // 이니셜 라이저를 초기화하는 방법
  /*
    1. 이니셜라이저를 이용 ==> init (모든 변수를 초기화)
    2. 초기값을 지정
   */
  var flipCount: Int = 0 {
    didSet {
      flipCountLabel.text = "Flips : \(flipCount)"
    }
  }
  
  private var flipCountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  private var cardButtons = [UIButton]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(flipCountLabel)
    
    for emoji in emojiChoices {
      let button = UIButton(type: .system)
      button.addTarget(self, action: #selector(touchCard(_:)), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      
      cardButtons.append(button)
    }
    
    
    view.backgroundColor = .red
  }
  
  func flipCard(withEmoji emoji: String, on button: UIButton) {
    // flipCard 함수 내부에선 내부 이름을 사용하여야된다. ==> emoji, button
    if button.currentTitle == emoji {
      button.setTitle("", for: .normal)
      button.backgroundColor = .orange
    } else {
      button.setTitle(emoji, for: .normal)
      button.backgroundColor = .white
    }
  }
  
  @objc func touchCard(_ sender: UIButton) {
    // flipCard 함수를 사용할 때 외부 이름인 withEmoji, on을 사용
    flipCount += 1
    flipCard(withEmoji: "👻", on: sender)
  }
}

