//
//  LotteriaMenuType.swift
//  kiosk
//
//  Created by hong on 2023/07/28.
//

import Foundation

enum LotteriaMenuType: DetailMenu {
    case burger
    case chicken
    case dessert
    case drink
}

extension LotteriaMenuType {
    var instance: Menu {
        switch self {
        case .burger:
            return Menu(name: "burger", description: "롯데리아 버거")
        case .chicken:
            return Menu(name: "chicken", description: "롯데리아 치킨")
        case .dessert:
            return Menu(name: "dessert", description: "롯데리아 디저트")
        case .drink:
            return Menu(name: "drink", description: "롯데리아 드링크")
        }
    }
}

enum LotteriaBurger: DetailMenu {
    case 한우불고기버거
    case 한우_트러플머쉬룸
    case 더블_한우불고기
    case 불고기버거
    case 원조빅불
}

extension LotteriaBurger {
    var instance: Menu {
        switch self {
        case .한우불고기버거:
            return Menu(name: "한우불고기버기", price: 8400, description: "한우불고기버기")
        case .한우_트러플머쉬룸:
            return Menu(name: "한우 트러플머쉬룸", price: 9700, description: "한우 트러플머쉬룸")
        case .더블_한우불고기:
            return Menu(name: "더블 한우불고기", price: 12400, description: "더블 한우불고기")
        case .불고기버거:
            return Menu(name: "불고기버거", price: 4700, description: "불고기버거")
        case .원조빅불:
            return Menu(name: "원조빅불", price: 7_100, description: "원조빅불")

        }
    }
}

enum LotteriaChicken: DetailMenu {
    case 치킨
    case 화이어윙
    case 치킨휠레
}

extension LotteriaChicken {
    var instance: Menu {
        switch self {
        case .치킨:
            return Menu(name: "치킨", price: 2_800, description: "일부 점포 한정으로 다리, 날개 2부위 중 선택이 가능하였으나, 2017년 1월 부터 모든 매장에서 따로 선택이 불가능하고 무작위로 제공된다.")
        case .화이어윙:
            return Menu(name: "화이어윙", price: 4_700, description: "얇은 튀김옷을 입힌 버팔로 윙. 대체로 2조각이면 기름종이에 싸서 봉투에 담아주고 4조각부터는 박스에 담아서 준다.")
        case .치킨휠레:
            return Menu(name: "치킨휠레", price: 4_700, description: "치킨휠레")
        }
    }
}

enum LotteriaDessert: DetailMenu {
    case 포테이토
    case 웨지포테이토
    case 양념감자
    case 치즈스틱
}

extension LotteriaDessert {
    var instance: Menu {
        switch self {
        case .포테이토:
            return Menu(name: "포테이토", price: 2_200, description: "포테이토")
        case .웨지포테이토:
            return Menu(name: "웨지포테이토", price: 2_100, description: "2022년 8월 재출시")
        case .양념감자:
            return Menu(name: "양념감자", price: 2_300, description: "오니언/칠리/치즈 중 택1, 허니버터는 판매종료")
        case .치즈스틱:
            return Menu(name: "치즈스틱", price: 2_400, description: "2조각")
        }
    }
}

enum LotteriaDrink: DetailMenu {
    case 펩시콜라_펩시_제로슈거
    case 칠성사이다
    case 아이스티
    case 오렌지주스
    case 망고피치
}

extension LotteriaDrink {
    var instance: Menu {
        switch self {
        case .펩시콜라_펩시_제로슈거:
            return Menu(name: "펩시콜라/펩시 제로슈거", price: 1_900, description: "펩시콜라/펩시 제로슈거")
        case .칠성사이다:
            return Menu(name: "칠성사이다", price: 1_900, description: "칠성사이다")
        case .아이스티:
            return Menu(name: "아이스티", price: 2_200, description: "아이스티")
        case .오렌지주스:
            return Menu(name: "오렌지주스", price: 2_500, description: "오렌지주스")
        case .망고피치:
            return Menu(name: "망고피치", price: 2_500, description: "일부점 판매 중지")
        }
    }
}
