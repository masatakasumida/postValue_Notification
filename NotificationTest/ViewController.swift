//
//  ViewController.swift
//  NotificationTest
//
//  Created by 住田雅隆 on 2022/09/03.
//

import UIKit

// 遷移元画面
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //         通知を登録
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(secondViewControllerCall),
                                               name: .secondViewNotification,
                                               object: nil)
    }

    //     通知から呼ばれる
    @objc func secondViewControllerCall(notification: Notification) {
        // 通知から渡された値を取り出す
        if let text = notification.userInfo?["viewControllerKey"] as? Int {
            // ラベルに値を設定
            label.text = String(text)
        }
    }

    @IBAction func postValue(_ sender: Any) {
        //         通知呼び出し
        NotificationCenter.default.post(name: Notification.Name.secondViewNotification,
                                        object: nil, userInfo: ["viewControllerKey": 20])

    }
    // ボタン押下時に画面遷移
    @IBAction func pushNext(_ sender: UIButton) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let secondVC = sb.instantiateViewController(identifier: "secondView") as! SecondViewController
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
