import UIKit

enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(String, ounces: Int)
    case cookie
    
    func isIncludedInSpecialOrder(number: Int) -> Bool {
        switch self {
        case .hamburger(let pattyCount):
            return pattyCount == number
        case .fries, .cookie:
            return true
        case .drink(_, let ounces):
            return ounces == 16
    }
        
    var calories: Int {
        return 0
    }
        
        mutating func switchToBeingACookie() {
            self = .cookie
        }
}

enum FryOrderSize {
    case large
    case small
}

let menuItem = FastFoodMenuItem.hamburger(numberOfPatties: 2)
var otherItem: FastFoodMenuItem = .cookie
// var yetAnotherItem = .cookie     // 오류 발생 ==> 타입 추론을 하기 위해선 한쪽이라도 타입 명시가 되어있어야함

switch menuItem {
case FastFoodMenuItem.hamburger:
    print("burger")
case FastFoodMenuItem.fries:
    print("fries")
case FastFoodMenuItem.drink:
    print("drink")
case FastFoodMenuItem.cookie:
    print("cookie")
}
