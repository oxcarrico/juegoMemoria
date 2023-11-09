import UIKit

class finJuego: UIViewController {
    var puntu: [Int] = []
    
    @IBOutlet weak var puntuacionesLabel: UILabel!
    @IBOutlet weak var puntuacionMaximaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actualizarPuntuacionesLabel()
        actualizarPuntuacionMaxima()
        guardarPuntuacionLocalmente()
        puntuar()
        print(puntu)
        UserDefaults.standard.object(forKey: "PP")
    }
    
    func actualizarPuntuacionesLabel() {
        puntuacionesLabel.text = "Puntuacion de partida: \(puntuaciones)"
    }
    
    func actualizarPuntuacionMaxima() {
        let puntuacionMaxima = UserDefaults.standard.integer(forKey: "PuntuacionMaxima")
        if puntuaciones > puntuacionMaxima {
            UserDefaults.standard.set(puntuaciones, forKey: "PuntuacionMaxima")
            puntuacionMaximaLabel.text = "Puntuación Máxima: \(puntuaciones)"
        } else {
            puntuacionMaximaLabel.text = "Puntuación Máxima: \(puntuacionMaxima)"
        }
    }
    @IBAction func puntuar(){
        puntu.append(puntuaciones)
        UserDefaults.standard.set(puntuaciones, forKey: "PP")
    }
    func guardarPuntuacionLocalmente() {
       
        UserDefaults.standard.set(puntuaciones, forKey: "PuntuacionActual")
    }
}
