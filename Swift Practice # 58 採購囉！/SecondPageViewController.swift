//
//  SecondPageViewController.swift
//  Swift Practice # 58 採購囉！
//
//  Created by CHEN PEIHAO on 2021/8/11.
//

import UIKit

class SecondPageViewController: UIViewController {

    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var moneyGapLabel: UILabel!
    
    var totalPrice: String!
    var itemPrice: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //上面的label顯示第一頁計算出來的金額
        totalPriceLabel.text = "你共付出 \(totalPrice!) 元"
        
        //將第一頁取得的兩個資料轉型為int給後面判斷
        let totalpriceInt = Int(totalPrice!)
        let itemPrincInt = Int(itemPrice!)
        
        //物品價格等於付錢的價格
        if itemPrincInt! == totalpriceInt! {
            moneyGapLabel.text = " 你算的剛剛好 真厲害 "
            moneyGapLabel.textColor = .black
        //物品價格大於付錢的價格
        }else if itemPrincInt! > totalpriceInt! {
            moneyGapLabel.text = "可惜 還差\(itemPrincInt! - totalpriceInt!) 元"
            moneyGapLabel.textColor = .red
        //物品價格小於付錢的價格
        }else if itemPrincInt! < totalpriceInt! {
            moneyGapLabel.text = "等等你多付\(totalpriceInt! - itemPrincInt!) 元"
            moneyGapLabel.textColor = .blue
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
