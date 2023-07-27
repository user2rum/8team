enum MainMenu: Int {
    case burgers = 1
    case frozenCustard
    case drinks
    case beer
    case exit
}

enum BurgerMenu: Int {
    case shackburger = 1
    case smokeshack
    case shroomburger
    case cheeseburger
    case hamburger
    case back1
}

enum FrozenCustardMenu: Int {
    case shakes = 1
    case shakeoftheweek
    case redbeenshake
    case floats
    case back2
    
}

enum DrinksMenu: Int {
    case shakemadelemonade = 1
    case freshbrewedicedtea
    case fiftyfifty
    case fountainsoda
    case abitarootbeer
    case bottledwater
    case back3
}

enum BeerMenu: Int {
    case shakemeisterale = 1
    case magpiebrewingco
    case thehandandmalt
    case back4
}

class KioskMenu {
    func printMenu() {
        print("SHACKSHACK 버거에 오신 것을 환영합니다.")
        print("1. Burgers")
        print("2. Frozen Custard")
        print("3. Drinks")
        print("4. Beer")
        print("5. Exit")
        print("Enter the number of your choice: ", terminator: "")
    }
    
    func printBurgerMenu() {
        print("====== Burgers =====")
        print("1. Shack Burger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거")
        print("2. Smoke Shack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
        print("3. Shroom Burger. | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
        print("4. Cheese burger. | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
        print("5. Hamburger      | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거")
        print("6. Back")
        print("Enter the number of your choice: ", terminator: "")
    }
    
    func printFrozenCustardMenu() {
        print("===== Frozen Custard =====")
        print("1. Shaeks           | W 5.9 | 바닐라, 초콜릿, 솔티드 카라멜, 블랙 & 화이트, 스트로베리, 피넛버터, 커피")
        print("2. Smoke Shack      | W 6.5 | 특별한 커스터드 플레이버")
        print("3. Red Been Shake   | W 6.5 | 신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크")
        print("4. Floats           | W 5.9 | 루트 비어, 퍼플 카우, 크림시클")
        print("5. Back")
    }
    
    func printDrinksMenu() {
        print("===== Drinks =====")
        print("1. Shaek made Lemonade     | Regular W 3.9 Large W 4.5 | 매장에서 직접 만드는 상큼한 레몬에이드(오리지널/시즈널)")
        print("2. Fresh Brewed Iced Tea   | Regular W 3.4 Large W 3.9 | 직접 유기농 홍차를 우려낸 아이스티")
        print("3. Fifty / Fifty           | Regular W 3.5 Large W 4.4 | 레몬에이드와 아이스티의 만남")
        print("4. Fountain Soda           | Regular W 2.7 Large W 3.3 | 코카콜라, 코카콜라 제로, 스프라이트, 환타 오렌지, 환타 그레이프")
        print("5. Abita Root Beer         | W 4.4 | 청량감 있는 독특한 미국식 무알콜 탄산음료")
        print("6. Bottled Water           | W 1.0 | 지리산 암반 대수층으로 만든 프리미엄 생수")
        print("7. Back")
    }
    
    func printBeerMenu() {
        print("===== Beer =====")
        print("1. Shake Meister Ale    | W 9.8 | 쉐이크쉑 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주")
        print("2. Magpie Brewing Co.   | W 6.8 | ")
        print("3. The Hand and Malt    | W 6.8 | ")
        print("4. Back")
    }

    func printMainMenuResult(_ result: MainMenu) {
        switch result {
        case .burgers:
            print("Burgers 메뉴를 선택하셨습니다.")
        case .frozenCustard:
            print("Frozen Custard 를 선택하셨습니다.")
        case .drinks:
            print("Drinks 를 선택하셨습니다.")
        case .beer:
            print("Beer 을 선택하셨습니다.")
        case .exit:
            print("종료합니다.")
        }
    }
    
    func printBurgerResult(_ result: BurgerMenu) {
        switch result {
        case .shackburger:
            print("Shack Burger 를 선택하셨습니다.")
        case .smokeshack:
            print("Smoke Shack 를 선택하셨습니다.")
        case .shroomburger:
            print("Shroom Burger 를 선택하셨습니다.")
        case .cheeseburger:
            print("Cheese Burger 를 선택하셨습니다.")
        case .hamburger:
            print("Hamburger 를 선택하셨습니다.")
        case .back1:
            print("메인 메뉴로 돌아갑니다.")
        }
    }
    
    func printFrozenCustardResult(_ result: FrozenCustardMenu) {
        switch result {
        case .shakes:
            print("Shakes 를 선택하셨습니다.")
        case .shakeoftheweek:
            print("Shake of the Week 를 선택하셨습니다.")
        case .redbeenshake:
            print("Red Been Shake 를 선택하셨습니다.")
        case .floats:
            print("Floats 를 선택하셨습니다.")
        case .back2:
            print("메인 메뉴로 돌아갑니다.")
        }
    }
    
    func printDrinksResult(_ result: DrinksMenu) {
        switch result {
        case .shakemadelemonade:
            print("Shake made Lemonade 를 선택하셨습니다.")
        case .freshbrewedicedtea:
            print("Fresh Brewed Iced Tea 를 선택하셨습니다.")
        case .fiftyfifty:
            print("Fifty / Fifty 를 선택하셨습니다.")
        case .fountainsoda:
            print("Fountain Soda 를 선택하셨습니다.")
        case .abitarootbeer:
            print("Abita Root Beer 를 선택하셨습니다.")
        case . bottledwater:
            print("Bottled Water 를 선택하셨습니다.")
        case .back3:
            print("메인 메뉴로 돌아갑니다.")
        }
    }
    
    func printBeerResult(_ result: BeerMenu) {
        switch result {
        case .shakemeisterale:
            print("Shake Meister Ale 를 선택하셨습니다.")
        case .magpiebrewingco:
            print("Magpie Brewing Co. 를 선택하셨습니다.")
        case .thehandandmalt:
            print("The Hand and Malt 를 선택하셨습니다.")
        case .back4:
            print("메인 메뉴로 돌아갑니다.")
        }
    }
}

var isRunning = true
let menu = KioskMenu()

while isRunning {
    menu.printMenu()

    if let input = readLine(), let choice = Int(input) {
        if let mainMenuChoice = MainMenu(rawValue: choice) {
            switch mainMenuChoice {
            case .exit:
                isRunning = false
            case .burgers:
                var isBurgerMenuRunning = true
                while isBurgerMenuRunning {
                    menu.printBurgerMenu()
                    if let burgerMenuChoice = BurgerMenu(rawValue: Int(readLine() ?? "0") ?? 0) {
                        if burgerMenuChoice == .back1 {
                            isBurgerMenuRunning = false
                        } else {
                            menu.printBurgerResult(burgerMenuChoice)
                        }
                    } else {
                        print("잘못된 입력입니다. 다시 입력해주세요.")
                    }
                }
            case .frozenCustard:
                var isFrozenCustardMenuRunning = true
                while isFrozenCustardMenuRunning {
                    menu.printFrozenCustardMenu()
                    if let frozenCustardMenuChoice =
                        FrozenCustardMenu(rawValue: Int(readLine() ?? "0") ?? 0){
                        if frozenCustardMenuChoice == .back2{
                            isFrozenCustardMenuRunning = false
                        } else {
                            menu.printFrozenCustardResult(frozenCustardMenuChoice)
                        }
                    } else {
                        print("잘못된 입력입니다. 다시 입력해주세요.")
                    }
                }
            case .drinks:
                var isDrinkMenuRunning = true
                while isDrinkMenuRunning {
                    menu.printDrinksMenu()
                    if let drinksMenuChoice =
                        DrinksMenu(rawValue: Int(readLine() ?? "0") ?? 0){
                        if drinksMenuChoice == .back3{
                            isDrinkMenuRunning = false
                        } else {
                            menu.printDrinksResult(drinksMenuChoice)
                        }
                    } else {
                        print("잘못된 입력입니다. 다시 입력해주세요.")
                    }
                }
            case .beer:
                var isBeerMenuRunning = true
                while isBeerMenuRunning {
                    menu.printBeerMenu()
                    if let beerMenuChoice = BeerMenu(rawValue: Int(readLine() ?? "0") ?? 0){
                        if beerMenuChoice == .back4{
                            isBeerMenuRunning = false
                        } else {
                            menu.printBeerResult(beerMenuChoice)
                        }
                    } else {
                        print("잘못된 입력입니다. 다시 입력해주세요.")
                    }
                }
                
            default:
                menu.printMainMenuResult(mainMenuChoice)
            }
        } else {
            print("잘못된 입력입니다. 다시 입력해주세요.")
        }
    } else {
        print("잘못된 입력입니다. 숫자를 입력해주세요.")
    }
}
