//
//  Currency.swift
//  xo-project
//
//  Created by Jean-Stephane Mowgli Thibault  on 12/06/2016.
//  Copyright © 2016 Jean-Stephane Mowgli Thibault . All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class                   Currency
{
    internal var        _From: String
    internal var        _To: String
    internal var        _key: String
    
    
    func        DisplayRes(TextLabel: UILabel, From: Double, To: Double, Value: Double) -> Void
    {
        var     res: Double
        
        print("test1")
        res = Value / From
        print("test2")
        res = res * To
        print("-->", res)
        TextLabel.hidden = false
        TextLabel.text = String(res)
    }
    
    func lol() {
        
    }
    
    init(From: String, To: String, value: String, TextLabel: UILabel)
    {
        _From = From
        _To = To
        _key = "a3572f1ebfa5e95944d715fcd2ce35cc"
        Alamofire.request(.GET, "http://www.apilayer.net/api/live?access_key=" + _key, parameters: ["currencies": self._From + "," + self._To])
            .responseJSON { response in

                var res = JSON(response.result.value!)
                let CurrentFrom = res["quotes"]["USD" + self._From].double
                let CurrentTo = res["quotes"]["USD" + self._To].double
                print(res)
                if (CurrentFrom != nil && CurrentTo != nil)
                {
                    print(CurrentTo)
                    print(CurrentFrom)
                }
                self.DisplayRes(TextLabel, From: CurrentFrom!, To: CurrentTo!, Value: Double(value)!)
        }
    }
}