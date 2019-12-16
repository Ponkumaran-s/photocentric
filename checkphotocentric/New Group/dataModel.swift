
import Foundation
import UIKit
struct DataInfo {
     private init() {}
     static var dataInstance = DataInfo()
    let image : [UIImage] = [#imageLiteral(resourceName: "IMG_42503"),#imageLiteral(resourceName: "forest_fog_dark_127172_2560x1080"),#imageLiteral(resourceName: "IMG_42503"),#imageLiteral(resourceName: "forest_fog_dark_127172_2560x1080")]
    
    
    let status : [String] = ["updated 3hrs ago","updated 3hrs ago","updated 3hrs ago","updated 3hrs ago"]
    
    
    let title : [String] = ["dfdsfdfdsfffffgfdsddfggfggdfgdgffffgfdsddfggfggdfgdgf","dfdsfdfdsfffffgfdsddfggfggdfgdgffffgfdsddfggfggdfgdg","dgdfdfdfdfdfdfdxcxcxcxcxcxcxcfdfgdgg","ffff"]
}

struct DataModel {
    let image : UIImage
    let status :String
    let title : String
    
    
    init(image:UIImage = #imageLiteral(resourceName: "IMG_42503") ,status:String = "",title:String = ""){
           self.image = image
           self.status = status
           self.title = title
          
      }
}
