#Juego de Secuencia de Imágenes

Esta aplicación móvil, desarrollada en Swift utilizando el framework UIKit, presenta un entretenido juego donde los usuarios deben seleccionar una serie de imágenes en el orden correcto. El juego incluye seis imágenes únicas que se presentan en un orden aleatorio, desafiando a los jugadores a recordar y seleccionar la secuencia correcta.

Capturas de Pantalla

(Incluir capturas de pantalla o gifs que muestren la interfaz y la jugabilidad del juego)

Características

Secuencia Aleatoria: Las imágenes se presentan en un orden aleatorio para proporcionar un desafío dinámico en cada partida.
Puntuaciones Actuales y Máximas: La aplicación realiza un seguimiento de la puntuación actual del jugador y la puntuación máxima alcanzada, proporcionando una retroalimentación inmediata.
Integración con Firebase: Utiliza Firebase para almacenar las puntuaciones, permitiendo a los usuarios comparar sus resultados y competir por la puntuación más alta.
Tecnologías Utilizadas

Swift: Lenguaje de programación principal para el desarrollo de la aplicación.
UIKit: Framework utilizado para construir la interfaz de usuario intuitiva y receptiva en iOS.
Firebase: Plataforma de desarrollo móvil de Google, empleada para almacenar y gestionar las puntuaciones de los jugadores.
Configuración

Clonación del Repositorio:
bash
Copy code
git clone https://github.com/tu-usuario/tu-repositorio.git
Apertura del Proyecto en Xcode:
Abre el proyecto utilizando Xcode.
Asegúrate de tener las dependencias instaladas y configuradas.
Configuración de Firebase:
Configura tu proyecto con las credenciales de Firebase según la documentación oficial.
Uso

Juego:
Abre la aplicación en un emulador o dispositivo iOS.
Sigue las instrucciones en pantalla para jugar y seleccionar las imágenes en el orden correcto.
swift
Copy code
// Ejemplo de fragmento de código que maneja la lógica del juego
@IBAction func buttonPressed(_ sender: UIButton) {
    // ... lógica de manejo de pulsaciones y comparación de secuencia ...
}
Registro de Puntuaciones:
Observa tu puntuación y la puntuación máxima al final del juego.
Las puntuaciones se registran en Firebase al avanzar a la siguiente pantalla.
swift
Copy code
// Ejemplo de fragmento de código que registra la puntuación localmente
func guardarPuntuacionLocalmente() {
    UserDefaults.standard.set(puntuaciones, forKey: "PuntuacionActual")
}
Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras errores o tienes sugerencias de mejoras, por favor, abre un issue o envía un pull request.
