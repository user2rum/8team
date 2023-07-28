//
//  class.swift
//  KioskApp
//
//  Created by Lee on 2023/07/25.
//

import Foundation


class AllMenu {
    
    let name: String
    let price: Int
    var comp: [String]
    
    init(name: String, price: Int, comp: [String]) {
        self.name = name
        self.price = price
        self.comp = comp
    }

    func showPrint() {
        print("품명 : \(name)")
        print("가격 : \(price) 원")
        print("구성 : \(comp.joined(separator: ", "))")
    }
    
}
class Burger: AllMenu {
    var setPrice: Int {
        return price + 2500
    }
    override func showPrint() {
        print("품명 : \(name)")
        print("단품가격 : \(price) 원,  세트가격:\(setPrice) 원")
        print("구성 : \(comp.joined(separator: ", "))")
    }
}

class Drinks: AllMenu {
    var large: Int {
        return price + 1000
    }
    override func showPrint() {
        print("품명 : \(name)")
        print("레귤러사이즈 : \(price) 원,  라지사이즈: \(large) 원")
        print("구성 : \(comp.joined(separator: ", "))")
    }
}

class sideMenu: AllMenu {}

//햄버거
    func cB() {
        
        var cb = Burger (name: "치킨버거", price: 5000, comp: ["치킨패티", "치즈", "토마토","야채"])
        
        cb.showPrint()
    }
    
    func dB() {
        var dB = Burger (name: "더블버거", price: 5000, comp: ["불고기페티 * 2", "치즈", "토마토","야채"])
        dB.showPrint()
    }
    
    func chB() {
        var chB = Burger (name: "치즈버거", price: 5000, comp: ["불고기페티","치즈", "토마토","야채"])
        chB.showPrint()
        
    }

//음료수
func coke() {
    var coke = Drinks(name: "콜라", price: 2000, comp: ["콜라", "머그컵"])
coke.showPrint()
    
}
func cider() {
    var cider = Drinks(name: "사이다", price: 2000, comp: ["사이다", "머그컵"])
cider.showPrint()
}
func coffee() {
    var coffee = Drinks(name: "커피", price: 1500, comp: ["커피", "머그컵"])
coffee.showPrint()
}

//사이드 메뉴

func fF() {
    var fF = sideMenu(name: "감자튀김", price: 3000, comp: ["감자튀김", "케찹","시즈닝 가루"])
fF.showPrint()
}
func cS() {
    var cS = sideMenu(name: "치즈 스틱", price: 2500, comp: ["치즈 스틱 * 2"])
cS.showPrint()
}
func chS() {
    var chS = sideMenu(name: "치킨 샐러드", price: 3000, comp: ["조각치킨", "샐러드", "드레싱 소스"])
    chS.showPrint()
    
}



//
//////////
//func burgerL() {
//    
//    let burgerList: [burgerList] = BurgerList.allCases
//    
//    for (index, type) in burgerList.enumerated() {
//     let number = index + 1
//        print("\(number). \(type) burger")
//    }
//}

//
//    func admin() {
//        print("관리할 메뉴를 선택해 주세요.")
//        print("1.버거메뉴 관리.")
//        print("2.음료메뉴 관리")
//        print("3.사이드메뉴 관리")
//    }
