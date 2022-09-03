//
//  SecondViewController.swift
//  NotificationTest
//
//  Created by 住田雅隆 on 2022/09/03.
//

import UIKit

// 遷移先画面
class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 通知を登録
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewControllerCall),
                                               name: .secondViewNotification,
                                               object: nil)
    }
    //     通知から呼ばれる
    @objc func ViewControllerCall(notification: Notification) {
        // 通知から渡された値を取り出す
        if let text = notification.userInfo?["viewControllerKey"] as? Int {
            // ラベルに値を設定
            secondLabel.text = String(text)
        }
    }

    @IBAction func pushBack(_ sender: UIButton) {

        // 遷移前画面に戻る
        navigationController?.popViewController(animated: true)
    }
    @IBAction func postValue(_ sender: Any) {
        //         通知呼び出し
        NotificationCenter.default.post(name: Notification.Name.secondViewNotification,
                                        object: nil, userInfo: ["viewControllerKey": 10])

    }
}
