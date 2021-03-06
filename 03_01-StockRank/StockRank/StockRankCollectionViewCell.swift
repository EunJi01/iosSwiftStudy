//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 황은지 on 2022/05/27.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // uicomponent 연결하자
    // uicomponent 에 데이터를 업데이트 하는 코드를 넣자
    
    @IBOutlet weak var rankLable: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLable: UILabel!
    @IBOutlet weak var companyPriceLable: UILabel!
    @IBOutlet weak var diffLable: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    func configure(_ stock: StockModel) {
        rankLable.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLable.text = stock.name
        companyPriceLable.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        // if 문 사용
        //        if stock.diff >= 0 {
        //            diffLable.textColor = .red
        //        }
        //        else {
        //            diffLable.textColor = .blue
        //        }
        
        // 삼항연산자 사용
        diffLable.textColor = stock.diff >= 0 ? .red : .blue
        
        diffLable.text = "\(stock.diff)%"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
    
    // likeButton을 탭하였을 때 색상을 변경시켜보자
    var lButton :Bool = false
    
    @IBAction func changeLikeButtonTapped(_ sender: UIButton) {
        if lButton {
            lButton = false
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            lButton = true
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
        print("변경 완료")
    }
}
