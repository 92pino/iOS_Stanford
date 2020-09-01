//
//  Card.swift
//  StackView_AutoLayout
//
//  Created by JinBae Jeong on 2020/08/31.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

/*
 구조체와 클래스의 차이
 
 - 구조체는 상속성이 없다
 - 구조체는 값 타입, 클래스는 참조 타입
   - 값 타입은 인자로 보내거나 배열에 넣거나 다른 변수에 할당해도 복사가 된다.
   - 힙에 자료형이 담겨 있고 그 자료형에 포인터를 쓸 수 있는데 자료형을 여러 군데에서 사용한다면 그 자료형을 보내는 게 아닌 자료형을 가리키는 포인터를 보내는것
 - 구조체가 받는 공짜 이니셜라이저는 모든 변수를 초기화한다.
 */

struct Card {
  var isFaceUp = false
  var isMatched = false
  var identifier: Int
  
  static var identifierFactory = 0
  
  static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
  }
  
  init() {
    self.identifier = Card.getUniqueIdentifier()
  }
}
