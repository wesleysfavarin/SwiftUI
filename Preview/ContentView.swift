//
//  ContentView.swift
//  Preview
//
//  Created by wesley s favarin on 07/06/19.
//  Copyright © 2019 wesley s favarin. All rights reserved.
//

import SwiftUI
struct Post {
    let id: Int
    let username, text, profileImageName, imageName: String
    static let samplePosts: [Post] = [
        .init(id: 1, username: "João Maranhão (Jota)", text: "Modelando e dcumentando apis com GraphQL", profileImageName: "Jota", imageName: "jotaEvent4"),
        .init(id: 2, username: "Leonardo (Leo)", text: "Como funciona a Programação Funcional", profileImageName: "Leo", imageName: "file20"),
        .init(id: 3, username: "João (Joãozinho)", text: "Frontend com Angular 7 e muito mais", profileImageName: "Joao", imageName: "file7"),
        .init(id: 4, username: "Rafael Bielawski (Biela)", text: "DevSecOps tudo sobre pipeline mobile", profileImageName: "Biela", imageName: "file14"),
        .init(id: 5, username: "Wesley S. Favarin", text: "Hands on ios swift com MVVM-C e SWIFT UI (Swift Compose), Android Kotlin com MVP e muito mais", profileImageName: "wesley", imageName: "file5"),
        .init(id: 6, username: "Camila Hayashi", text: "Chefe de todo mundo rsrs", profileImageName: "camila", imageName: "file6"),
        .init(id: 7, username: "Danilo Dias", text: "Implantando o management 3.0 como cultura do banco", profileImageName: "danilo", imageName: "file8"),
        .init(id: 8, username: "Cristiano (Barack)", text: "BDD e TDD em ação, com quem entende do assunto", profileImageName: "barack", imageName: "file23")
    ]
}
struct Group {
    let id: Int
    let name, imageName, description: String
    static let sampleGroups: [Group] = [
        .init(id: 1, name: "João (Jota)", imageName: "Jota", description:"Arquiteto especialista backend"),
        .init(id: 2, name: "Leonardo", imageName: "Leo",description:"Arquiteto DevSecOps"),
        .init(id: 3, name: "Rafael Bielawski", imageName: "Biela",description:"Arquiteto DevSecOps Mobile"),
        .init(id: 4, name: "Wesley S. Favarin", imageName: "wesley",description:"Arquitetura técnica mobile nativo iOS/Android e cross Flutter/XamarinForms"),
        .init(id: 5, name: "Camila Hayashi", imageName: "camila",description:"Gerente de arquitetura e especialista em técnologia"),
        .init(id: 6, name: "João (Joãozinho)", imageName: "Joao",description:"Hands on arquiteto tecnico frontend"),
        .init(id: 7, name: "Cristiano (Baracks) ", imageName: "barack",description:"Arquiteto especialista backend"),
        .init(id: 8, name: "Danilo Dias", imageName: "danilo",description:"Arquiteto de canais, especialista mobile frontend e backend")
       
    ]
}
struct ContentView : View {
    
    let posts = Post.samplePosts
    
    var body: some View {
        HStack {
            NavigationView {
                List {
                    VStack (alignment: .leading) {
                        Text("Palestrantes").font(.headline).padding(.leading, 16).padding(.bottom, 4)
                        ScrollView (showsHorizontalIndicator: false) {
                            HStack {
                                ForEach(Group.sampleGroups.identified(by: \.imageName)) { group in
                                    NavigationButton(destination: GroupDetailView(group: group)) {
                                        GroupView(group: group).padding(.trailing, 8)
                                    }
                                }
                                }.padding(.leading, 16).padding(.trailing, 8)
                                }.frame(height: 180)
                                }.padding(.top, 8).padding(.leading, -20).padding(.trailing, -20)
                    
                                ForEach(posts.identified(by: \.id)) { post in
                                    PostView(post: post).padding(.bottom)
                                }
                    
                                }.navigationBarTitle(Text("ARQT-Meetups"), displayMode: .automatic)
                            }
            
                        }
    }
}
struct GroupDetailView: View {
    let group: Group
    var body: some View {
        VStack {
            Image(group.imageName)
            Text(group.description)
            }.navigationBarTitle(Text(group.name))
    }
}
struct GroupView: View {
    let group: Group
    var body: some View {
        VStack {
            Image(group.imageName).renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(5).clipped()
            Text(group.name).color(.primary).lineLimit(2).frame(width: 100, height: 50, alignment: .leading).font(.headline)
        }
    }
}

struct PostView: View {
    let post: Post
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image(post.profileImageName).resizable().frame(width: 50, height: 50).clipShape(Circle()).clipped()
                VStack (alignment: .leading) {
                    Text(post.username).font(.headline)
                    Text("Postado 8 hrs atrás").font(.body)
                    }.padding(.leading, 8)
                }.padding(.leading, 16)
            Text(post.text).padding(.leading, 16).padding(.trailing, 36).lineLimit(nil)
            
            Image(post.imageName, bundle: nil)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            }.padding(.leading, -20).padding(.trailing, -20).padding(.top, 12).padding(.bottom, -26)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
