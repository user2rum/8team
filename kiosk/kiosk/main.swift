import Foundation

class KioskMenu {
    func printMenu() {
        print("SHACKSHACK 버거에 오신걸 환영합니다.")
        print("아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.")
        print("1. Burgers              | 앵거스 비프 통살을 다져만든 버거")
        print("2. Frozen Custard       | 매장에서 신선하게 만드는 아이스크림")
        print("3. Drinks               | 매장에서 직접 만드는 음료")
        print("4. Beer                 | 뉴욕 브루클린 브루어리에서 양조한 맥주")
        print("5. Back       | 프로그램 종료")
        print("Enter the number of your choice: ", terminator: "")
    }
    
    func processUserChoice(choice: Int) -> Bool {
        switch choice {
        case 1:
            showMenu1()
        case 2:
            showMenu2()
        case 3:
            showMenu3()
        case 4:
            showMenu4()
        case 5:
            showMenu5()
            
            print("Exiting the program.")
            return false
        default:
            print("잘못된 접근입니다. 다시 실행해 주십시오.")
        }
        return true
    }
    
    func getUserInput() -> Int {
        if let input = readLine(), let choice = Int(input) {
            return choice
        } else {
            return 0
        }
    }
    
    func showMenu1() {
        print("Burgers 를 선택하셨습니다.")
        // 1번 메뉴 눌렀을 때 입력 문구
    }
    
    func showMenu2() {
        print("Frozen Custard 를 선택하셨습니다.")
        // 2번 메뉴 눌렀을 때 입력 문구
    }
    
    func showMenu3() {
        print("Drinks 를 선택하셨습니다.")
        // 3번 메뉴 눌렀을 때 입력 문구
    }
    
    func showMenu4() {
        print("Beer 를 선택하셨습니다.")
        // 4번 메뉴 눌렀을 때 입력 문구
    }
    
    func showMenu5(){
        print("이전 진행 사항으로 돌아갑니다.")
        // 5번 메뉴 눌렀을 때 입력 문구
    }
}

var isRunning = true
let menu = KioskMenu()

while isRunning {
    menu.printMenu()
    let userChoice = menu.getUserInput()
    isRunning = menu.processUserChoice(choice: userChoice)
}
