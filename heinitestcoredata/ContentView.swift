//
//  ContentView.swift
//  heinitestcoredata
//
//  Created by Marcel Zimmermann on 31.01.23.
//

import SwiftUI

// einzelnen Schritte zum Implementieren von CoreData

// im Prgm über NewGroup dann new File Core Data File benutzen
// Add Entity und eindeutigen Namen vergeben
// und eine descr vom Typ String anlegen
// und eine done vom Typ Boolean anlegen für ja und nein 
struct ContentView: View {
    
    // Einbinden des ShoeVieModels
    @StateObject var shoeViewModel = ShoeViewModel()
    
    // setzen einer Vaiable deren Wert wir behalten wollen
    @State var shoeTextField : String = ""
    
    // hinzufügen einer alertvariablen
    @State private var presentAlert: Bool = false
    @State private var isPushed: Bool = false
    @State private var isPresented: Bool = false
    @State private var isSaved : Bool = false
    
    
    
    @State private var showNextView = false
    // Anzeigebereich
    var body: some View {
    
         
        
        
        // Navigationsstapel
        NavigationStack {
            
            Image("shoe")
                .resizable()
                .frame(width: 400)
            // Verical Stapel mit Abstand
            
            VStack(spacing: 20) {
                HStack {
                    // Textfield mit Binding
                    TextField("Add here your new Shoe",text: $shoeTextField)
                        .font(.headline)
                        .padding(.leading)
                        .frame(height: 50)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(.horizontal)
                        
                    
                    //
                    Button {
                        guard !shoeTextField.isEmpty else{return}
                        shoeViewModel.addShoe(shoeTextField)
                        shoeTextField = ""
                    } label: {
                        Text("Add Shoe")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(width: 100)
                            .border(Color.gray, width: 2)                        .background(Color.red)
                            .cornerRadius(5)
                            .padding(.horizontal)
                            .foregroundColor(Color.yellow)
                    }
                    
                    
                    
                    
                }
                
                
                
                Divider()
                    .foregroundColor(Color(.lightGray))
                
                Text("Hier erscheinen eure Sammlungen")
                    .background(Color(.lightGray))
                    .foregroundColor(Color.white)
                    .font(.system(size:18))
                    .underline()
                    .bold()
                
                // Erstellung der ShoeListe mit Hilfe von ForEach
                    List{
                        ForEach(shoeViewModel.savedRequests){ shoe in
                            HStack{
                                Image(systemName: shoe.done ? "checkmark.circle.fill": "checkmark.circle")
                                Text(shoe.descr ?? "no desc.")
                            }
                            .listRowBackground(shoe.done ? Color.gray : Color.white)
                            .onTapGesture {
                                shoeViewModel.updateShoe(shoe: shoe)
                            }
                        }
                        .onDelete(perform: shoeViewModel.deleteShoe)
                    }
                    
                }.navigationTitle("Deine Schuhsammlung")
                    .foregroundColor(Color.blue)
            
            }
        Button("Create Account")
        {

        }
        .foregroundColor(Color(.lightGray))
        }
    }

    // Vorschau
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            CreateProfilView()
        }
    }

