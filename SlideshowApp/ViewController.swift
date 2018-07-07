import UIKit

class ViewController: UIViewController {

//UIImageVIewの接続-------------------------------------------------------------------------
   @IBOutlet weak var Picture: UIImageView!

    //写真の番号を指定する変数Numberを宣言
    var Number: Int = 1
    //写真の枚数を宣言
    let a: Int = 20
//-----------------------------------------------------------------------------------------
    
    
//viewDisLoad------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //画像ファイルを読み込む
        var image = UIImage(named: "1.jpg")
        Picture.image = image
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
        } else {
        //番号が枚数を超えた時、1番の写真に戻ります
        Number = 1
        var image = UIImage(named: "1.jpg")
        Picture.image = image
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
        } else {
            //番号が1となった場合、写真番号がaである写真に移動します
            Number = 20
            var image = UIImage(named: "\(a).jpg")
            Picture.image = image
        }
    }
//-------------------------------------------------------------------------------------------
    
}

