//
//  MemoViewController.swift
//  MemoPad
//
//  Created by Kanno Taichi on 2024/08/25.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var  titleTextField : UITextField!
    @IBOutlet weak var  contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles : [String] = []
    var contents: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark: userDefalysから古いメモを取得
        saveData.register(defaults: ["titles":[],"contents":[]  ])
        
        //userDefaltからデータを取得し、各配列に代入
        titles = saveData.object(forKey: "titles" ) as! [String]
        contents = saveData.object(forKey: "contents")as! [String]
        //Mark: --
        print(titles)
        print(contents)
        //titleTextField.text = saveData.object(forKey: "title") as? String
        //contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
// Do any additional setup after loading the view.
        
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveMemo(_ sender: Any){
        // Mark: -userDefaultsにデータを保存
        //STEP1 入力データを変数に格納
        let title = titleTextField.text!
        let content = contentTextView.text!
        //STEP2 古いメモにメータを入力
        titles.append(title)
        contents.append(content)
        //STEP3
        saveData.set(titles, forKey: "title")
        saveData.set(contents, forKey: "content")
        //Mark: -
        
        let alert: UIAlertController=UIAlertController(title: "保存", message: "メモの保存が完了しました",preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title:"OK",
                                          style: .default,
                                          handler: { action in
                                       // print("ボタンが押されました")
                self.navigationController?.popViewController(animated: true)
                
        })
        
        )
        present(alert, animated: true, completion: nil)
                                     
    }

}
