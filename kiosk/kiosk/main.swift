import Foundation

/**
- Lv1
    - 입력받은 숫자에 따라 다른 로직을 실행하는 코드를 작성
    - if나 switch, guard 문을 활용
    - 반복문을 이용해서 특정 번호가 입력되면 프로그램을 종료
    - readline 함수로 값을 입력
- Lv2
    - 필요한 클래스들을 설계 (버거, 아이스크림, 음료, 맥주, 주문, 공통 등)
    - 클래스들의 프로퍼티와 메소드를 정의
    - 메소드를 이용해서 Lv1의 코드를 개선
- Lv3
    - Lv2에서 설계한 클래스들을 상속 관계를 가지도록 변경 (Burger도 부모 클래스를 가질 수 있을지 고민!)
    - 하나의 리스트객체로 모든 메뉴들을 관리하도록 수정 (List)
    - 선택한 리스트의 요소를 삭제
- Lv4*
    - 숫자를 입력해야하는데 문자를 입력했을때 다시 입력할 수 있도록 예외를 처리
    - 현재 잔액과 가격을 비교해서 구매 가능한 상태를 정의 (클래스 추가가능)
- Lv5*
    - 특정 작업이 종료된 후, 3초뒤에 다른 작업을 수행할 수 있도록 코드를 작성
    - 결제시 현재 시간을 비교하여 특정 시간대에는 결제할 수 없다는 알림창을 띄우기
    - 프로그램을 종료할때까지 5초마다 현재 주문 대기수를 실시간으로 출력
*/




func greeting() {
    print("안녕하세요! 맥도날드 키오스크 입니다")
    print("오늘은 어떻게 드시겠습니까?")
    
}

func divider() {
    print("")
    print("=============================")
    print("")
}

func getValue() -> String {
    let selectedValue = readLine() ?? ""
    print("\(selectedValue)를 선택하셨습니다.") // TODO : 번호가 아닌 그 번호와 같은 name이 표시되도록 변경..
    
    return selectedValue
}

// 1. 매장식사, 테이크 아웃 여부
class WhereToEat {
    
    struct Option {
        var name : String // 옵션명
    }
    // 버거 메뉴 Array
    var options : [Option] = []
    
    init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
        options.append(Option(name: "매장 식사(For Here)"))
        options.append(Option(name: "테이크 아웃(To-Go)"))
    }
    
    func askToCustomer() -> Void {
        print("")
        print("해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
//        for item in options {
//            print(item)
//        }
        for (index, item) in options.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name)")
        }
    }
    
}

// 2. 메뉴 카테고리
class MenuCategories {
    
    struct Menu {
        var name : String // 카테고리
        var info : String // 설명
    }
    // 메뉴 카테고리 Array
    var menuCategories : [Menu] = []
    
    init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
        menuCategories.append(Menu(name: "버거(Burger)", info: "\n빅맥에서 맥 스파이스 상하이 버거까지, \n주문 즉시 바로 조리해 더욱 맛있는, \n맥도날드의 다양한 버거를 소개합니다."))
        menuCategories.append(Menu(name: "맥런치(McLunch)", info: "\n오전 10시 30분 부터 오후 2시까지 \n점심만의 특별한 할인으로 맥런치 세트를 즐겨보세요!"))
        menuCategories.append(Menu(name: "맥모닝(McMorning)", info: "\n새벽 4시부터 오전 10시 30분까지 \n갓 구워내 신선한 맥모닝으로 \n따뜻한 아침 식사를 챙겨드세요!"))
        menuCategories.append(Menu(name: "해피 스낵(Happy Snack)", info: "\n시즌 별 인기 스낵을 하루종일 \n할인 가격으로 만나보세요!"))
        menuCategories.append(Menu(name: "사이드 & 디저트(Sides & Desserts)", info: "\n가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도, \n언제나 맛있는 사이드와 디저트 메뉴!"))
        menuCategories.append(Menu(name: "맥카페 & 음료(McCafe & Beverages)", info: "\n언제나 즐겁게, 맥카페와 다양한 음료를 \n부담없이 즐기세요!"))
    }
    
    func askToCustomer() -> Void {
        print("")
        print("다음은 카테고리 선택입니다\n해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
//        for item in options {
//            print(item)
//        }
        for (index, item) in menuCategories.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name)")
//          print("[\(index+1)] \(item.name) : \(item.info)")
        }
    }
}

// 3-1 메뉴 : 버거
class BurgerMenu {
    
    struct Burger {
        var name : String // 버거명
        var price : Int // 가격
        var info : String // 상품소개
    }
    // 버거 메뉴 Array
    var burgerMenu : [Burger] = []
    
    init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
        burgerMenu.append(Burger(name: "진도 대파 크림 크로켓 버거", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "빅맥", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "더블 쿼터파운더 치즈", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "쿼터파운더 치즈", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "맥크리스피 디럭스 버거", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "맥크리스피 클래식 버거", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "맥스파이시 상하이 버거", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "맥치킨 모짜렐라", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "맥치킨", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "더블 불고기 버거", price: 5000, info: ""))
        burgerMenu.append(Burger(name: "애그 불고기 버거", price: 5000, info: ""))
    }
    func askToCustomer() -> Void {
        print("")
        print("해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
//        for item in options {
//            print(item)
//        }
        for (index, item) in burgerMenu.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name) (\(item.price)원)")
        }
    }
    
}

// 메인
func kioskMain() {
    let whereToEat = WhereToEat()
    let menuCategories = MenuCategories()
    let burgerMenu = BurgerMenu()
    
    divider()
    greeting()
    whereToEat.askToCustomer()
    divider()
    if getValue() == "1" {
        print("※　매장 식사 시 환경보호를 위해 음료는 머그컵에 제공됩니다.")
    }
    menuCategories.askToCustomer()
    divider()
    if getValue() == "1" {
        burgerMenu.askToCustomer()
    } else {
        print("키오스크 준비 중 입니다.")
    }
}



// Start
kioskMain()
