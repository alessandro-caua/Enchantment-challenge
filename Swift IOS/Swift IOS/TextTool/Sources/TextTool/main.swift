import SwiftUI

struct ContentView: View {
    @State private var showResult = false
    @State private var isCorrect = false
    
    let animal = "Elefante"
    let animalImage = "elefante" // Nome da imagem no projeto
    let options = ["Elefante", "Tigre", "Girafa", "Leão"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Adivinhe o animal!")
                .font(.largeTitle)
                .bold()
            
            Image(animalImage)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Quem sou eu?")
                .font(.headline)
                .padding()
            
            ForEach(options, id: \.self) { option in
                Button(action: {
                    isCorrect = option == animal
                    showResult = true
                }) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            
            if showResult {
                Text(isCorrect ? "Correto! era \(animal)!" : "Errado, tente denovo!")
                    .font(.title2)
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
            }
        }
        .padding()
    }
}

@main
struct AnimalGuessingGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
