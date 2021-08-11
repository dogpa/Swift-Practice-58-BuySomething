//
//  ViewController.swift
//  Swift Practice # 58 採購囉！
//
//  Created by CHEN PEIHAO on 2021/8/11.
//

import UIKit

class ViewController: UIViewController {
    

    
    //顯示button點選後的emoji
    @IBOutlet weak var ItemEmojiLabel: UILabel!
    //物品名稱
    @IBOutlet weak var itemNameLabel: UILabel!
    //物品金額
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    
    //八種新台幣規格的Stepper的 outlet collection
    @IBOutlet var moneySteppers: [UIStepper]!
    //新台幣的stepper數值的labe的array
    @IBOutlet var steppersLabel: [UILabel]!
    
    
    //計算不顯示的label
    @IBOutlet weak var resuleLabel: UILabel!
    
    
    //建立品項的emoji,名稱,價格的array
    let itemEmojiArray = ["🍎","🍔","⏰","⚽️","🚙","✈️"]
    let itemNameArray = ["蘋果","漢堡","鬧鐘","足球","汽車","飛機"]
    let itemPriceArray = ["17","99","200","2361","10008","23789"]
    
    //建立8個變數給之後新台幣stepper與新台幣label使用
    var thousand:Int = 0
    var fivehundreds:Int = 0
    var twoHundreds:Int = 0
    var hundred:Int = 0
    var fifty:Int = 0
    var ten:Int = 0
    var five:Int = 0
    var one:Int = 0
    
    
    //程式執行計算總價
    func calculateMoney () {
        let totalMoney = (thousand*1000) + (fivehundreds*500) + (twoHundreds*200) + (hundred*100) + (fifty*50) + (ten*10) + (five*5) + (one*1)
        resuleLabel.text = "\(totalMoney)"
    }
    //func執行傳遞值給各自的新台幣label
    func dollorsLabelChange () {
        steppersLabel[0].text = "\(thousand)"
        steppersLabel[1].text = "\(fivehundreds)"
        steppersLabel[2].text = "\(twoHundreds)"
        steppersLabel[3].text = "\(hundred)"
        steppersLabel[4].text = "\(fifty)"
        steppersLabel[5].text = "\(ten)"
        steppersLabel[6].text = "\(five)"
        steppersLabel[7].text = "\(one)"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clickToChangeItem(ArrayNumber: Int.random(in: 0...5))
    }
    
    //function傳入參數執行改變顯示emoji的圖案、名字、以及價格
    func clickToChangeItem (ArrayNumber: Int) {//[array的第幾個值]
        
        ItemEmojiLabel.text = itemEmojiArray[ArrayNumber]//emoji圖片
        itemNameLabel.text = "你要買的是\(itemNameArray[ArrayNumber])" //顯示買的內容
        itemPriceLabel.text = itemPriceArray[ArrayNumber] //顯示買的價格
    }
    
    
    //六個Emoji Button的Action
    @IBAction func appleChange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 0)
    }
    @IBAction func hamburageChange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 1)
    }
    @IBAction func timerShange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 2)
    }
    
    @IBAction func foofballChange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 3)
    }
    @IBAction func carChange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 4)
    }
    @IBAction func airplaneChange(_ sender: UIButton) {
        clickToChangeItem(ArrayNumber: 5)
    }
    

    
    @IBAction func howManyMineys(_ sender: UIStepper) {
        //將每一個stepper的值指派給各自的變數
        thousand = Int(moneySteppers[0].value)
        fivehundreds = Int(moneySteppers[1].value)
        twoHundreds = Int(moneySteppers[2].value)
        hundred = Int(moneySteppers[3].value)
        fifty = Int(moneySteppers[4].value)
        ten = Int(moneySteppers[5].value)
        five = Int(moneySteppers[6].value)
        one = Int(moneySteppers[7].value)
        
        //執行兩個剛剛建立好的function功能
        calculateMoney()
        dollorsLabelChange()
        
    }
    

    @IBAction func resetButton(_ sender: Any) {
        //透過建立好的outlet collection透過迴圈快速歸零
        for i in 0...7 {
            steppersLabel[i].text = "0"
            moneySteppers[i].value = 0
            resuleLabel.text = "0"
        }
       
    }
    
    @IBSegueAction func goToSecondPage(_ coder: NSCoder) -> SecondPageViewController? {
        let controller = SecondPageViewController(coder: coder)
        //指派兩個第二頁的類別的資料來源是誰
        controller?.itemPrice = itemPriceLabel.text
        controller?.totalPrice = resuleLabel.text
        print(itemPriceLabel.text!)
        print(resuleLabel.text!)
        return controller
        
    }
    
    
    
}

