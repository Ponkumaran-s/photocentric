//
//  PhotoCentricViewController.swift
//  checkphotocentric
//
//  Created by Ponkumar's Mac on 10/12/19.
//  Copyright © 2019 Ponkumar's Mac. All rights reserved.
//

import UIKit

class PhotoCentricViewController: UIViewController {
  var dataInfoObj = DataInfo.dataInstance
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension PhotoCentricViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table") as! PhotoCenticTableViewCell
        print(dataInfoObj.title)
        cell.titleArray = dataInfoObj.title
        cell.setupValues()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    
}
