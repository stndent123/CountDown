//
//  ViewController.swift
//  CountDown
//
//  Created by joseph on 2020/10/13.
//

import UIKit

var timer: Timer?

class ViewController: UIViewController {
    @IBOutlet weak var nowTimeLabel: UILabel!
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var intervalTimeLabel: UILabel!
    @IBOutlet weak var changeDatePicker: UIDatePicker!
    
    var setTime = Date()
    //取得現在的時間
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeDatePicker.minimumDate = Date()
        //datepicker的日期只能從今天開始選擇，不能選今天以前的時間
        
        changeDatePicker.datePickerMode = .dateAndTime
        
        changeDatePicker.locale = Locale(identifier: "zh_CN")
        //datepicker的年月日顯示中文
        
        
        
        nowTimeLabel.text = "目前是"+timeFormatter(setTime)
        
        if let timer = timer {
            timer.invalidate()
        }
        
        //計時器，withTimeInterval間隔時間，repeats重複
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            
            let interval = Int(self.changeDatePicker.date.timeIntervalSinceNow)
            let second = interval % 60
            let minute = interval / 60 % 60
            let hour = interval / 3600 % 24
            let day = interval / (3600*24)
            self.intervalTimeLabel.text = "\(day)天\(hour)小時\(minute)分\(second)秒"
        })
    }

    func  timeFormatter(_ time: Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return formatter.string(from: time)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
    
        
        
        setTimeLabel.text = "夜華回來的日子是"+timeFormatter(changeDatePicker.date)
    }
}

