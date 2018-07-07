import UIKit

class ViewController: UIViewController {

//UIImageVIewの接続-------------------------------------------------------------------------
   @IBOutlet weak var Picture: UIImageView!

    //写真の番号を指定する変数Numberを宣言
    var Number: Int = 1
    
    
//viewDisLoad------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //画像ファイルを読み込む
        var image = UIImage(named: "1.jpg")
        Picture.image = image
    }
    
    
//MemoryWarning----------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//「進む」ボタン------------------------------------------------------------------------------
    @IBAction func Go(_ sender: Any) {
        if Number < 20 {
        Number += 1
        var image = UIImage(named: "\(Number).jpg")
        Picture.image = image
        } else {
        Number = 1
        var image = UIImage(named: "1.jpg")
        Picture.image = image
        }
    }

}

