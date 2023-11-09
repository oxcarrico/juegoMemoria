import UIKit

class puntuacionesView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var puntuacionesGuardadas: [Int] = [1,3,4]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self

       
        cargarPuntuacionesGuardadas()
        print(puntuacionesGuardadas)
    }

    func cargarPuntuacionesGuardadas() {
        if let puntuacionActual = UserDefaults.standard.object(forKey: "PuntuacionActual") as? Int {
            puntuacionesGuardadas.append(puntuacionActual)
        }
        
    }
    func guardadosPuntuaciones() {
        let puntuacionguardada = UserDefaults.standard.integer(forKey: "Puntuacionguardada")
            UserDefaults.standard.set(puntuaciones, forKey: "Puntuacionguardada")
        }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puntuacionesGuardadas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "puntuacionCell", for: indexPath) as UITableViewCell

        
        cell.textLabel?.text = "Puntuación: \(puntuacionesGuardadas[indexPath.row])"

        return cell
    }
    @IBAction func quitar(_ sender: UIButton) {
        puntuaciones = 0
    }
    
}
