//
//  ViewController.swift
//  StackView_AutoLayout
//
//  Created by JinBae Jeong on 2020/08/31.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
  
  var flipCount: Int = 0 {
    didSet {
      countLabel.text = "Flips : \(flipCount)"
    }
  }
  
  private let cardView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  private lazy var countLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 40)
    label.text = "Flips : 0"
    
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    makeABCbtns()
  }
  
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//    countLabel.text = "Flips : \(flipCount)"
//  }
  
  private func makeABCbtns(){
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(cardView)
    cardView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    cardView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    cardView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    
    let list = [["🐶", "🐱", "🐭", "🐹"], ["🐰", "🦊", "🐻", "🐼"], ["🐨", "🐯", "🦁", "🐮"]]
    var groups = [UIStackView]()
    
    for i in list {
      let group = createButtons(named: i)
      let subStackView = UIStackView(arrangedSubviews: group)
      subStackView.axis = .horizontal
      subStackView.distribution = .fillEqually
      subStackView.spacing = 1
      groups.append(subStackView)
    }
    
    let stackView = UIStackView(arrangedSubviews: groups)
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.spacing = 1
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    cardView.addSubview(stackView)
    
    stackView.leadingAnchor.constraint (equalTo: cardView.leadingAnchor,  constant: 0).isActive = true
    stackView.topAnchor.constraint     (equalTo: cardView.topAnchor,      constant: 0).isActive = true
    stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0).isActive = true
    stackView.bottomAnchor.constraint  (equalTo: cardView.bottomAnchor,   constant: 0).isActive = true
    
    view.addSubview(countLabel)
    countLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
    countLabel.centerXAnchor.constraint (equalTo: view.centerXAnchor, constant: 0).isActive = true
    countLabel.bottomAnchor.constraint  (equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    countLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  func createButtons(named: [String]) -> [UIButton]{
    return named.map { letter in
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle(letter, for: .normal)
      button.backgroundColor = .orange
      button.setTitleColor( .blue , for: .normal)
      button.addTarget(self, action: #selector(cardButton), for: .touchUpInside)
      return button
    }
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
  
  @objc func cardButton(_ sender: UIButton) {
    flipCount += 1
  }
}


