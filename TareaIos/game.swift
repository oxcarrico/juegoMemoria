import UIKit

var puntuaciones = 0

class game: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var patoButton: UIButton!
    @IBOutlet weak var aliButton: UIButton!
    @IBOutlet weak var dodoButton: UIButton!
    @IBOutlet weak var gatoButton: UIButton!

    var imageArray = ["Pato", "Ali", "Dodo", "Gato", "Kata", "Lobo"]
    var buttonOrder: [String] = []
    var buttonPressOrder: [String] = []
    var counter = 0
    var timer: Timer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }

    @objc func changeImage() {
        if counter < 6 {
            let randomIndex = Int(arc4random_uniform(UInt32(imageArray.count)))
            let imageName = imageArray[randomIndex]
            imagen.image = UIImage(named: imageName)
            counter += 1
            buttonOrder.append(imageName)
        } else {
            timer?.invalidate()
            imagen.isHidden = true
        }
    }

    func endGame() {
        performSegue(withIdentifier: "finJuego", sender: self)
    }

    @IBAction func patallaPerder(_ sender: UIButton) {
        endGame()
    }

    func winGame() {
        performSegue(withIdentifier: "finJuego", sender: self)
    }

    @IBAction func patallaGanar(_ sender: UIButton) {
        winGame()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        buttonPressOrder.append(buttonTitle)

        if buttonPressOrder.count == buttonOrder.count {
            for i in 0..<buttonOrder.count {
                if buttonPressOrder[i] == buttonOrder[i] {
                    puntuaciones += 1
                }
            }
            print("Puntuaciones: \(puntuaciones)")
            if buttonPressOrder == buttonOrder {
                print("¡Has presionado los botones en el orden correcto!")
                winGame()
            } else {
                endGame()
            }
        }
    }

    @IBAction func Dodo(_ sender: Any) {

    }

    @IBAction func Ali(_ sender: Any) {

    }

    @IBAction func Gato(_ sender: Any) {

    }

    @IBAction func Pato(_ sender: Any) {

    }

    @IBAction func Lobo(_ sender: Any) {
    }

    @IBAction func Kata(_ sender: Any) {
    }
}
