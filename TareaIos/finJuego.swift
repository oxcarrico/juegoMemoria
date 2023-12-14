import UIKit

class finJuego: UIViewController {
    var puntuaciones: Int = 0  

    @IBOutlet weak var puntuacionesLabel: UILabel!
    @IBOutlet weak var puntuacionMaximaLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        actualizarPuntuacionesLabel()
        actualizarPuntuacionMaxima()
        guardarPuntuacionLocalmente()
        puntuar()
        print(puntuaciones)
        UserDefaults.standard.object(forKey: "PP")

        enviarPuntuacionAPI(puntuacion: puntuaciones)  // Enviar la puntuación al terminar la partida
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

    @IBAction func puntuar() {
        
        UserDefaults.standard.set(puntuaciones, forKey: "PP")
    }

    func guardarPuntuacionLocalmente() {
        UserDefaults.standard.set(puntuaciones, forKey: "PuntuacionActual")
    }

    func enviarPuntuacionAPI(puntuacion: Int) {
        guard let url = URL(string: "https://proyectojuegodememoria-default-rtdb.europe-west1.firebasedatabase.app/.json") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonData: [String: Any] = ["puntuacion": puntuacion]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonData)
        } catch let error {
            print("Error serializing JSON: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error en la solicitud: \(error)")
                return
            }

            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Respuesta de la API: \(responseString ?? "")")
            }
        }

        task.resume()
    }
}
