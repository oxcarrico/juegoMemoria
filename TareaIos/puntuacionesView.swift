import UIKit

class PuntuacionesView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var puntuacionesGuardadas: [Int] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        cargarPuntuacionesDesdeAPI()
    }

    func cargarPuntuacionesDesdeAPI() {
        guard let url = URL(string: "https://proyectojuegodememoria-default-rtdb.europe-west1.firebasedatabase.app/.json") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error en la solicitud: \(error)")
                return
            }

            guard let data = data else {
                print("Datos no válidos")
                return
            }

            do {
           
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

               
                if let puntuaciones = json?["puntuaciones"] as? [Int] {
                  
                    self.puntuacionesGuardadas = puntuaciones

                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch let error {
                print("Error al decodificar JSON: \(error)")
            }
        }

        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puntuacionesGuardadas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "puntuacionCell", for: indexPath) as UITableViewCell

        cell.textLabel?.text = "Puntuación: \(puntuacionesGuardadas[indexPath.row])"

        return cell
    }

 
}
