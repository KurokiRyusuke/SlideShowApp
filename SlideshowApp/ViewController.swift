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
//-----------------------------------------------------------------------------------------
    
    
//viewDisLoad------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //画像ファイルを読み込む
        var image = UIImage(named: "1.jpg")
        Picture.image = image
        //ラベルに1番と記載する
        PictureNumber.text = String("1 / \(a)")
        
        
    }
//-----------------------------------------------------------------------------------------
    
    
//MemoryWarning----------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//-----------------------------------------------------------------------------------------
    
    
//「進む」ボタン------------------------------------------------------------------------------
//ボタンを押すたびに、番号が１つ上の写真に移動します
    @IBAction func Go(_ sender: Any) {
        if Number < a {
        //番号がa以下であれば次の番号に移動します
        Number += 1
        var image = UIImage(named: "\(Number).jpg")
        Picture.image = image
        //ラベルに写真番号を示す
        PictureNumber.text = String(Number) + " / \(a)"
        
        } else {
        //番号が枚数を超えた時、1番の写真に戻ります
        Number = 1
        var image = UIImage(named: "1.jpg")
        Picture.image = image
        //ラベルに写真番号を示す
        PictureNumber.text = String(Number) + " / \(a)"
        }
    }
//------------------------------------------------------------------------------------------


//「戻るボタン」-------------------------------------------------------------------------------
//ボタンを押すために、番号が１つ下の写真に移動します
    @IBAction func Back(_ sender: Any) {
        if Number > 1 {
            //番号が1よりか大きい場合、１つ下の番号の写真に移動します
            Number -= 1
            var image = UIImage(named: "\(Number).jpg")
            Picture.image = image
            //ラベルに写真番号を示す
            PictureNumber.text = String(Number) + " / \(a)"
            
        } else {
            //番号が1となった場合、写真番号がaである写真に移動します
            Number = 20
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
    
        //b秒以上になった時点でタイマーを一度リセットし、写真の切り替えを行います
        if timer_sec > b {
            self.timer_sec = 0
            
            //この時の写真番号にて操作を分ける
            if Number < a {
                //番号がa以下であれば次の番号に移動します
                Number += 1
                var image = UIImage(named: "\(Number).jpg")
                Picture.image = image
                //ラベルに写真番号を示す
                PictureNumber.text = String(Number) + " / \(a)"
                
            } else {
                //番号が枚数を超えた時、1番の写真に戻ります
                Number = 1
                var image = UIImage(named: "1.jpg")
                Picture.image = image
                //ラベルに写真番号を示す
                PictureNumber.text = String(Number) + " / \(a)"
            }
        }
    }
    
//再生を行います
@IBAction func StartStop(_ sender: Any) {
// タイマー関数の作成、始動
Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
}
//--------------------------------------------------------------------------------------------

}














