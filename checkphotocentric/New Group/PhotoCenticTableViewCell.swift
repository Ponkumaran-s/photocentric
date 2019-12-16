//
//  photoCenticTableViewCell.swift
//  checkphotocentric
//
//  Created by Ponkumar's Mac on 10/12/19.
//  Copyright © 2019 Ponkumar's Mac. All rights reserved.
//

import UIKit

class PhotoCenticTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    var dataInfoObj = DataInfo.dataInstance
    var setData = DataModel()
    var titleArray = [String]()
    var dumlabel : UILabel = UILabel()
    var maxNumberOfLines:Int!
    var heightForRow = [Int]()
    var dataCount = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionViewOutlet.dataSource = self
        self.collectionViewOutlet.delegate = self
        let layout = collectionViewOutlet.collectionViewLayout as? Customlayout
               layout?.delegate = self
         self.collectionViewOutlet.reloadData()
    }

    public func setupValues() {
         
        setupDummyLabel()
        heightForRow = findnoLine(datainfo: titleArray)
        heightForRow = findHeightForRow(heightArray: heightForRow)
        print("000000")
        print(heightForRow)
        print("1212121")
    }
  
    
    
}

extension PhotoCenticTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{


    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           1
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = dataInfoObj.title.count
        count = count >= 4 ? 4 : count >= 2 ? 2 : 0
        dataCount = count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collect" , for: indexPath) as! PhotoCenticCollectionViewCell
        setData = DataModel(image: dataInfoObj.image[indexPath.row], status: dataInfoObj.status[indexPath.row], title: dataInfoObj.title[indexPath.row])
            cell.setView(data: setData)
        return cell
    }
    
}

extension  PhotoCenticTableViewCell {
    func setupDummyLabel() {
        dumlabel.frame.size.width = UIScreen.main.bounds.width/2
    }
    
        func findnoLine(datainfo : [String]) -> [Int]
        {
            var lineData1 = [Int]()
            let data1 = dataInfoObj.title
            for string1 in data1 {
                dumlabel.text = string1
                let count = dumlabel.maxNumberOfLines
                lineData1.append(count)
            }
            return lineData1
        }

      func findHeightForRow(heightArray : [Int] ) ->[Int] {
          var heightForRow = [Int]()
          let count = heightArray.count
          heightForRow =  count >= 4 ? maxNumber(array: heightArray, count: 2) : maxNumber(array: heightArray, count: 1)
          return heightForRow
      }
    
    public func maxNumber(array:[Int] ,count:Int) -> [Int] {
           var heightForRow = [Int]()
        if count == 1{
           heightForRow.append(array[count] >= array[count-1] ? array[count] : array[count-1])
        }
        else {
          
            heightForRow.append(array[count-2] >= array[count-1] ? array[count-2] : array[count-1])
            heightForRow.append(array[count] >= array[count+1] ? array[count] : array[count+1])
        }
            return heightForRow
       }
}

extension UILabel {
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
       let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font as Any], context: nil).height
        let lineHeight = font.lineHeight
       if (Int(ceil(textHeight / lineHeight))) > 3 {
          return 3
       }
       else{
           return Int(ceil(textHeight / lineHeight))
       }
    }
}



extension PhotoCenticTableViewCell : photocentricLayoutDelegate{
func collectionview(collectionview: UICollectionView, heightAtindexpath indexPath: NSIndexPath) -> CGFloat {
    let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "collect" , for:    indexPath as IndexPath) as! PhotoCenticCollectionViewCell
    
//    let cellHeight = cell.title.frame.size.height
//    cell.titleHeight.constant = cellHeight * CGFloat(heightForRow[0])
  //  cell.updateHeightStatus.constant = isStatusAvailable == true ? cellHeightConstant : 0.0
    if dataCount == 4 {
        if (indexPath.row == 0)||(indexPath.row == 1){
                cell.setframes(con: heightForRow[0])
        }else{
             cell.setframes(con: heightForRow[1])
        }
    }
    else {
         cell.setframes(con: heightForRow[0])
    }
     //  count = count >= 4 ? 4 : count >= 2 ? 2 : 0


    return (cell.titleHeight.constant + cell.statusHeight.constant + cell.imageHeight.constant)

}
}
