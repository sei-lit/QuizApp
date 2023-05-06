//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["幼稚園、小学生、大学生の中で一番大きいのはどれでしょうか？", "幼稚園", "小学生", "大学生", 1])
        quizArray.append(["奈良の大仏と鎌倉の大仏、先に立ったのはどちらでしょうか？", "奈良の大仏", "鎌倉の大仏", "どちらでもない", 3])
        quizArray.append(["A君はごはんを4はい食べました。Bくんは3ばい食べました。たくさん食べたのはどちらでしょうか？", "A君", "B君", "どちらも同じ", 2])
        quizArray.append(["カエルが10匹並んでいます。その中で一番小さなカエルは大人か子どもかどちらでしょうか？", "大人", "子供", "わからない", 1])
        quizArray.append(["箱の中にスイカが10個入っています。あなたはそこから5個取り出しました。今あなたは何個スイカを持っているでしょうか？", "5個", "2個", "0個", 2])
        //------------------------ここから上にクイズを書く------------------------//
        
        //quizArrayの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


