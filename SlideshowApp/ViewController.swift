import UIKit

class ViewController: UIViewController {

//UIImageVIewの接続など前準備-----------------------------------------------------------------
   @IBOutlet weak var Picture: UIImageView!

    //写真の番号を指定する変数Numberを宣言
    var Number: Int = 1
    //写真の枚数を宣言
    let a: Int = 20
    //写真番号を示すためのラベルも接続 「PictureNumber」
    @IBOutlet weak var PictureNumber: UILabel!
    //再生・停止機能実装のためのタイマー設定
    var timer: Timer!
    var timer_sec: Float = 0
    //連続再生時、一枚の写真を表示する秒数
    let b: Float = 2.0
    //再生、停止を分けるための変数(何回ボタンを押したか、回数を保存する変数)
    var Loop: Int = 0
    //再生、停止ボタンを押した回数が偶数か奇数か判断するための変数
    var Guki: Int = 0
    //拡大画像画面から戻ってくるための「戻る」ボタンの設定
    @IBAction func GoBack(_ segue: UIStoryboardSegue) { }
    //進むボタン、戻るボタンのOn/Offを設定するためにアウトレット
    @IBOutlet weak var GoStop: UIButton!
    @IBOutlet weak var BackStop: UIButton!
    //再生・停止ボタンの表記を変更するためのアウトレット
    @IBOutlet weak var StartOrStop: UIButton!
//-----------------------------------------------------------------------------------------
    
    
//viewDisLoad------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //画像ファイルを読み込む
        var image = UIImage(named: "1.jpg")
        //Pictureに値を受け渡す
        Picture.image = image
        //Viewサイズを画像サイズに合わせる
        Picture.contentMode = UIViewContentMode.scaleAspectFit
        //画像サイズに関する記述は以下サイトにて確認することができる
        //http://blog.officekoma.co.jp/2016/10/swiftuiimageviewcontentmode.html
        //ラベルに1番と記載する
        PictureNumber.text = String("1 / \(a)")
        //再生・停止ボタンに「再生」と表記する
        StartOrStop.setTitle("再生", for: .normal)
    }
//-----------------------------------------------------------------------------------------
    
    
//MemoryWarning----------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//-----------------------------------------------------------------------------------------

    
//「進む」ボタン------------------------------------------------------------------------------
//ボタンを押すたびに、番号が１つ上の写真に移動
    @IBAction func Go(_ sender: Any) {
        if Number < a {
        //番号がa以下であれば次の番号に移動
        Number += 1
        var image = UIImage(named: "\(Number).jpg")
        Picture.image = image
        //ラベルに写真番号を示す
        PictureNumber.text = String(Number) + " / \(a)"
        
        } else {
        //番号が枚数を超えた時、1番の写真に戻る
        Number = 1
        var image = UIImage(named: "1.jpg")
        Picture.image = image
        //ラベルに写真番号を示す
        PictureNumber.text = String(Number) + " / \(a)"
        }
    }
//------------------------------------------------------------------------------------------


//「戻るボタン」-------------------------------------------------------------------------------
//ボタンを押すために、番号が１つ下の写真に移動
    @IBAction func Back(_ sender: Any) {
        if Number > 1 {
            //番号が1よりか大きい場合、１つ下の番号の写真に移動
            Number -= 1
            var image = UIImage(named: "\(Number).jpg")
            Picture.image = image
            //ラベルに写真番号を示す
            PictureNumber.text = String(Number) + " / \(a)"
            
        } else {
            //番号が1となった場合、写真番号がaである写真に移動
            Number = a
            var image = UIImage(named: "\(a).jpg")
            Picture.image = image
            //ラベルに写真番号を示す
            PictureNumber.text = String(Number) + " / \(a)"
        }
    }
//-------------------------------------------------------------------------------------------
    
 
//「再生/停止ボタン」----------------------------------------------------------------------------
//連続再生のためのタイマー関数 updateTimer
@objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        //self.PictureNumber.text = String(format: "%.1f", timer_sec)
    
        //b秒以上になった時点でタイマーを一度リセットし、写真の切り替えを行う
        if timer_sec > b {
            self.timer_sec = 0
            
            //この時の写真番号にて操作を分ける
            if Number < a {
                //番号がa以下であれば次の番号に移動
                Number += 1
                var image = UIImage(named: "\(Number).jpg")
                Picture.image = image
                //ラベルに写真番号を示す
                PictureNumber.text = String(Number) + " / \(a)"
                
            } else {
                //番号が枚数を超えた時、1番の写真に戻る
                Number = 1
                var image = UIImage(named: "1.jpg")
                Picture.image = image
                //ラベルに写真番号を示す
                PictureNumber.text = String(Number) + " / \(a)"
            }
        }
    }
    
//再生を行う
@IBAction func StartStop(_ sender: Any) {
    //ボタンを押した回数をLoopに保存する
    Loop += 1
    //ボタンを押した回数が偶数か奇数かを判断する
    //Gukiが1である場合、ボタンを押した回数は奇数でありタイマーが作動する
    //GUkiが2である場合、ボタンを押した回数は偶数でありタイマーはストップする
    Guki = Loop % 2
    
    if Guki == 1 {
// タイマー関数の作成、始動　スライドショーが始まる
        if self.timer == nil {
self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        //再生機能が作動している間は、進む、戻るボタンは押せない状態とする
        self.GoStop.isEnabled = false
        self.BackStop.isEnabled = false
        //ラベルを停止に変更する
        StartOrStop.setTitle("停止", for: .normal)
        }
        
        } else {
        //ボタンを押した回数が奇数であれば、タイマーを破棄する
        if self.timer !== nil {
           self.timer.invalidate()
           self.timer = nil
        //停止機能が作動している間は、進む、戻るボタンを押せる状態にする
        self.GoStop.isEnabled = true
        self.BackStop.isEnabled = true
        //ラベルを再生に変更する
        StartOrStop.setTitle("再生", for: .normal)
        }
    }
}
//--------------------------------------------------------------------------------------------


//画面遷移--------------------------------------------------------------------------------------
    //Next画面にデータを受け渡すprepare(for:method)を設定する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController:NextViewController = segue.destination as! NextViewController
        //Next画面に写真ナンバーを受け渡す
        nextViewController.Big = Number
    }
    
    //画面遷移をする際には、スライドショーを一時停止する
    @IBAction func MoveToNext(_ sender: Any) {
        if self.timer !== nil {
           self.timer.invalidate()
           self.timer = nil
        //停止機能が作動している間は、進む、戻るボタンを押せる状態にする
        self.GoStop.isEnabled = true
        self.BackStop.isEnabled = true
        //ラベルを再生に変更する
        StartOrStop.setTitle("再生", for: .normal)
        //その分、「再生/停止」ボタンを押した回数を-1しておく
        Loop -= -1
        }
    }
//---------------------------------------------------------------------------------------------
}














