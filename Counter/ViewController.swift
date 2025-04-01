//
//  ViewController.swift
//  Counter
//
//  Created by Илья on 30.03.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var buttonPlus: UIButton!
    @IBOutlet private weak var buttonMinus: UIButton!
    @IBOutlet private weak var textHistrory: UITextView!
    private var count:Int = 0
    private var maintext: String = "Счетчик равен "
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        text.text = maintext + String(0)
        textHistrory.text = "История изменений:\n"
        buttonPlus.setTitle("+", for: .normal)
        buttonMinus.setTitle("-", for: .normal)
    }
    
    private func getDateTime() -> String {
        let getDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        return String(dateFormatter.string(from: getDate))
        
    }
    
    @IBAction private func changeTextPlus(_ sender: Any) {
        count += 1
        text.text = maintext + String(count)
        textHistrory.text += getDateTime() + ": значение изменено на +1\n"
    }
    
    @IBAction private func changeTextMinus(_ sender: Any) {
        count -= 1
        if count<0 {
            count=0
            textHistrory.text += getDateTime() + ": попытка уменьшить значение счётчика ниже 0\n"
        } else {
            textHistrory.text += getDateTime() + ": значение изменено на -1\n"
        }
        text.text = maintext + String(count)
        
    }
    @IBAction private func buttonRefresh(_ sender: Any) {
        count = 0
        text.text = maintext + String(count)
        textHistrory.text += getDateTime() + ": значение сброшено\n"
    }
}

