//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 黒木龍介 on 2018/07/08.
//  Copyright © 2018年 Ryusuke.Kuroki. All rights reserved.
//

import UIKit

//第二画面--------------------------------------------------------------------------------------
class NextViewController: UIViewController {
    
//写真ナンバーを受け取るための変数
//初期値は0に設定している
var Big: Int = 0
//UIViewを設定
@IBOutlet weak var BigPicture: UIImageView!
    
    
//VIewDidLoad----------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //画像ファイルを読み取る
        var BigImage = UIImage(named: "\(Big).jpg")
        //Pictureに値を受け渡す
        BigPicture.image = BigImage
        //Viewサイズを画像サイズに合わせる
        BigPicture.contentMode = UIViewContentMode.scaleAspectFit
        //画像サイズに関する記述は以下サイトにて確認することができる
        //http://blog.officekoma.co.jp/2016/10/swiftuiimageviewcontentmode.html
    }
//---------------------------------------------------------------------------------------------
    

//MemoryWarning--------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//---------------------------------------------------------------------------------------------
    

}
