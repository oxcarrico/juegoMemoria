#Juego de Secuencia de Imágenes
¡Bienvenido al Juego de Secuencia de Imágenes! Desarrollado en Swift con UIKit, este emocionante juego desafía tu memoria mientras intentas ordenar una secuencia de seis imágenes únicas. Sigue las instrucciones en pantalla, ¡y ve cuánto puedes recordar!

Capturas de Pantalla
Captura de Pantalla 1
Captura de Pantalla 2

Características
Secuencia Aleatoria: Las imágenes se presentan en un orden aleatorio para un desafío dinámico.
Puntuaciones Actuales y Máximas: Rastrea tu puntuación actual y la máxima para una retroalimentación instantánea.
Integración con Firebase: Almacena y comparte tus puntuaciones utilizando Firebase para competir por el primer lugar.
Tecnologías Utilizadas
Swift: Lenguaje principal.
UIKit: Framework para una interfaz de usuario intuitiva en iOS.
Firebase: Plataforma para gestionar puntuaciones y competir con otros jugadores.
Configuración
Clonación del Repositorio:

bash
Copy code
git clone https://github.com/tu-usuario/tu-repositorio.git
Apertura del Proyecto en Xcode:

Abre el proyecto en Xcode y asegúrate de tener todas las dependencias instaladas.
Configuración de Firebase:

Configura tu proyecto con las credenciales de Firebase según la documentación oficial.
Uso
Juego:
Abre la aplicación en un emulador o dispositivo iOS.
Sigue las instrucciones en pantalla para seleccionar las imágenes en el orden correcto.
swift
Copy code
// Ejemplo de manejo de la lógica del juego
@IBAction func buttonPressed(_ sender: UIButton) {
    // ... lógica de manejo de pulsaciones y comparación de secuencia ...
}
Registro de Puntuaciones:
Observa tu puntuación y la máxima al final del juego.
Las puntuaciones se registran en Firebase al avanzar a la siguiente pantalla.
swift
Copy code
// Ejemplo de registro de puntuación local
func guardarPuntuacionLocalmente() {
    UserDefaults.standard.set(puntuaciones, forKey: "PuntuacionActual")
}
Contribuciones
¡Las contribuciones son bienvenidas! Si encuentras errores o tienes sugerencias, por favor, abre un issue o envía un pull request.
