//
//  ContentView.swift
//  Act2
//
//  Created by Yusei García on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    // Estados para controlar la interfaz
    @State private var backgroundColor: Color = .white
    @State private var isImageVisible: Bool = true
    @State private var age: Double = 21
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            // Fondo dinámico
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Interfaz Gráfica en Swift")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Área de Imagen
                Group {
                    if isImageVisible {
                        Image("sample_image") // Asegúrate de añadir una imagen con este nombre en Assets.xcassets
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .opacity(opacity)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    } else {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 200)
                            .overlay(Text("Imagen Oculta").foregroundColor(.gray))
                    }
                }
                
                // Controles de Sliders
                VStack(alignment: .leading, spacing: 10) {
                    Text("Edad: \(Int(age)) años")
                        .font(.headline)
                    Slider(value: $age, in: 0...100, step: 1)
                        .accentColor(.blue)
                    
                    Text("Opacidad de la imagen: \(Int(opacity * 100))%")
                        .font(.headline)
                    Slider(value: $opacity, in: 0...1)
                        .accentColor(.purple)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(12)
                
                // Botones de Acción
                HStack(spacing: 20) {
                    Button(action: {
                        let colors: [Color] = [.blue, .green, .orange, .pink, .yellow, .cyan]
                        backgroundColor = colors.randomElement() ?? .white
                    }) {
                        Text("Color Fondo")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isImageVisible.toggle()
                    }) {
                        Text(isImageVisible ? "Ocultar" : "Mostrar")
                            .padding()
                            .background(Color.secondary)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        backgroundColor = .white
                        isImageVisible = true
                        age = 21
                        opacity = 1.0
                    }) {
                        Text("Reset")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
