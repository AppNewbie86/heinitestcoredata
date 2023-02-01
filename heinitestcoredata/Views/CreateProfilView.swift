//
//  CreateProfilView.swift
//  heinitestcoredata
//
//  Created by Marcel Zimmermann on 31.01.23.
//

import SwiftUI
import CoreData

struct CreateProfilView: View {
        
    @EnvironmentObject var shoeViewModel : ShoeViewModel
    @State private var showNextView = false

    
        @State private var firstName: String = ""
        @State private var lastName: String = ""
        @State private var age: String = ""
        @State private var gender: String = ""
        @State private var job: String = ""
        @State private var married: String = ""
    
    
    @State private var people: [(firstname: String, lastname: String, age: String, gender: String, job: String, married: String, favColor: String)] = [
           ("John", "Doe", "35", "Male", "Developer", "Yes", "Blue"),
           ("Jane", "Doe", "32", "Female", "Designer", "No", "Green"),
           ("Bob", "Smith", "40", "Male", "Doctor", "Yes", "Red"),
           ("Alice", "Johnson", "28", "Female", "Teacher", "No", "Yellow")
       ]
    
    @State private var animationAmount: CGFloat = 1

    

    var body: some View {
            VStack {
                ForEach(people.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            TextField("First Name", text: self.$people[index].firstname)
                            TextField("Last Name", text: self.$people[index].lastname)
                        }
                        HStack {
                            TextField("Age", text: self.$people[index].age)
                            TextField("Gender", text: self.$people[index].gender)
                        }
                        HStack {
                            TextField("Job", text: self.$people[index].job)
                            TextField("Married", text: self.$people[index].married)
                        }
                        HStack {
                            TextField("Favorite Color", text: self.$people[index].favColor)
                        }
                    }
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .scaleEffect(self.animationAmount)
                    .animation(.default)
                }
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        self.animationAmount += 1
                    }
                }) {
                    Text("Animate")
                }
            }
        }
    }
            // Vorschau
            struct CreateProfilView_Previews: PreviewProvider {
                static var previews: some View {
                    CreateProfilView()
                }
            }

        
    
