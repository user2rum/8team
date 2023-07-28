//
//  main.swift
//  KioskApp
//
//  Created by Lee on 2023/07/24.
//
import Foundation


func main() {
    print(" 원하시는 메뉴를 선택해주세요. ")
    print("1. 햄버거")
    print("2. 음료수")
    print("3. 사이드메뉴")
    print("0. 종료")
}

func admin() {
    print("관리할 메뉴를 선택해 주세요.")
    print("1.메뉴 추가")
    print("2.메뉴 삭제")
    print("3.메뉴 조회")
    print("0. 관리자모드 종료")
}


enum MenuSelect {
    case burger
    case drinks
    case sideMenu
}


func startMenu(){
while true {
main()

    if let select = readLine(),
       let kiosk = Int(select) {
        switch kiosk {
        case 1:
            twoPageMenu(menuSelect: .burger)
        case 2:
            twoPageMenu(menuSelect: .drinks)
        case 3:
            twoPageMenu(menuSelect: .sideMenu)
        case 0: print("종료")
            return
        case 1234:
            print("관리자 모드입니다. 수정 및 추가사항을 입력하세요.")
            admin()
            adminFunction()
            
            
        default:
            print("잘못 누르셨습니다.")
        }
    } else {
        print("잘못 누르셨습니다.")
        
    }
}
}



func twoPageMenu(menuSelect: MenuSelect) {
    var twoPageStarter = true
    while twoPageStarter {
    print("메뉴를 선택 해주세요.")

        switch  menuSelect{
        case .burger:
            print("1. 치킨버거")
            print("2. 더블버거")
            print("3. 치즈버거")
            print("0. 뒤로가기")
            if let a = readLine(),
               let b = Int(a) {
                switch b {
                case 1:
                    cB()
                    startMenu()
                    twoPageStarter = false
                case 2:
                    dB()
                    startMenu()
                    twoPageStarter = false
                case 3:
                    chB()
                    startMenu()
                    twoPageStarter = false
                case 0:
                    twoPageStarter = false
                default: print("잘못 누르셨습니다.")
                }
            }
        case .drinks:
            print("1. 사이다")
            print("2. 콜라")
            print("3. 커피")
            print("0. 뒤로가기")
            if let a = readLine(),
               let b = Int(a) {
                switch b {
                case 1:
                   print("선택한 메뉴의 상세목록")
                    cider()
                    startMenu()
                    twoPageStarter = false
                case 2:
                    print("선택한 메뉴의 상세목록")
                    coke()
                    startMenu()
                    twoPageStarter = false
                case 3:
                    print("선택한 메뉴의 상세목록")
                    coffee()
                    startMenu()
                    twoPageStarter = false
                case 0:
                    twoPageStarter = false
                default: print("잘못 누르셨습니다.")
                }
            }
        case .sideMenu:
            print("1. 감자튀김")
            print("2. 치즈스틱")
            print("3. 치킨셀러드")
            print("0. 뒤로가기")
            if let a = readLine(),
               let b = Int(a) {
                switch b {
                case 1:
                   print("선택한 메뉴의 상세목록")
                    fF()
                    startMenu()
                    twoPageStarter = false
                case 2:
                    print("선택한 메뉴의 상세목록")
                    cS()
                    startMenu()
                    twoPageStarter = false
                case 3:
                    print("선택한 메뉴의 상세목록")
                    chS()
                    startMenu()
                    twoPageStarter = false
                case 0:
                    twoPageStarter = false
                default: print("잘못 누르셨습니다.")
                }
            }
        default:
            print("잘못 누르셨습니다.")
        }
        print("메뉴를 선택 해주세요.")
        if let a = readLine(), let b = Int(a) {
            switch b {
            case 1, 2, 3:
                continue
            case 0:
                print ("뒤로가기")
            twoPageStarter = false
                main()
            default : print("잘못 누르셨습니다.")
            }
        } else {
            print("잘못 누르셨습니다.")
        }
        
    }
    
}


startMenu()


