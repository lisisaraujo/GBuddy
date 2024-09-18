//
//  PetView.swift
//  Projektwoche1
//
//  Created by Lisis Ruschel on 17.09.24.
//

//
//  PetView.swift
//  Projektwoche1
//
//  Created by Jakub Zwierz on 16.09.24.
//

import SwiftUI
import SwiftData

struct PetView: View {
    
    //    Pet view screen displays all the general information about the pet.
    
    @State var pet : Pet
    
    var body: some View {
        
        VStack{
            
            //    -----------------------------
            //        Upper UI Stack
            //    -----------------------------
            VStack{
                
                //            Top Row
                
                HStack{
                    
                    //                Birth day
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image("cake")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("\(pet.birthDate.formatted(date: .numeric, time: .omitted))")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                        }
                    }
                    .frame(width: 140, height: 140)
                    
                    Spacer()
                        .frame(width: 80)
                    
                    //                Breed
                    
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image("pet_card")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("\(pet.breed)")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                        }
                    }
                    .frame(width: 120, height: 120)
                        .offset(x:10, y: 40)
                }
                
                //            Main Middle Circle
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image(pet.image)
                                .resizable()
                                .frame(width: 140, height: 170)
                            Text("\(pet.name)")
                                .font(.custom("MarkerFelt-Thin", size: 50))
                                .offset(x:0, y:-20)
                        }
                    }
                    .frame(width: 260, height: 260)
                    
                }
                
                //            Bottom Row
                
                HStack{
                    
                    //                Weight
                    
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image("weight")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("\(pet.weight.formatted())")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                        }
                    }
                    .frame(width: 120, height: 120)
                        .offset(x:-20, y:-40)
                    
                    //                Size
                    
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image("ruler")
                                .resizable()
                                .frame(width: 50, height: 40)
                            Text("\(pet.size.rawValue)")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                        }
                    }
                    .frame(width: 100, height: 100)
                        .offset(x:-20, y:0)
                    //                Color
                    
                    ZStack{
                        Circle()
                            .fill(.lightBlue)
                            .shadow(radius: 4)
                        VStack{
                            Image("color_splatter")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("\(pet.color)")
                                .font(.custom("MarkerFelt-Thin", size: 20))
                        }
                    }
                    .frame(width: 100, height: 100)
                        .offset(x:10, y:-40)
                    
                }
            }
            .background(Image("background_paws")
                .resizable()
                .scaledToFill()
                .opacity(0.4)
            )
            
            //    -----------------------------
            //        Lower UI Stack
            //    -----------------------------
            
            VStack{
                List{
                    Section{
                        Text("Some Data")
                    }
                    Section{
                        Text("Some Data")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, Appointment.self,  configurations: configuration)
    
    let testPet : Pet = Pet(name: "Woofy",
                            type: .dog,
                            isChipped: false,
                            birthDate: Date(),
                            color: "Black",
                            weight: 50,
                            size: .big,
                            breed: "Corgi",
                            petsVet: Vet(fullName: "Jakub",
                                         assignedPets: [],
                                         appointments: []),
                            medicalRecord: MedicalRecord(allergies: [],
                                                         medications: [],
                                                         appointments: [],
                                                         vaccinations: []),
                            activities : [Activity(name: "Test Activity",
                                                   activityDescription: "Activity description",
                                                   date: Date(),
                                                   type: .sleep,
                                                   duration: 10.0,
                                                   isDone: false)],
                            owner: PetOwner(
                                name: "Tom",
                                surName: "Owner",
                                ownedPets: []),
                            image: "dog"
    )
    
    
    
    //   Preview data
    container.mainContext.insert(testPet)
    
    return PetView(pet: testPet)
        .modelContainer(container)
}
