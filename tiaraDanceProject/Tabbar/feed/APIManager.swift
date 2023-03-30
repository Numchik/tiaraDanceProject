//
//  APIManager.swift
//  tiaraDanceProject
//
//  Created by Максим Никитюк on 31.03.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    
    static let shared = APIManager ()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
        
    }
    
    func getPost(id: String, imadgeID: String, completion: @escaping (Post?) -> Void) {
        let db = configureFB()
        db.collection("Posts").document(id).getDocument() { (document, error) in
            guard  error == nil else {completion(nil); return}
            self.getImage(id: imadgeID, completion: {image in
                let post = Post(name: document?.get("Name") as! String, data: document?.get("Data") as! String, text: document?.get("Text") as! String, image: image)
                completion(post)
            })
            
        }
        
    }
    
    func getImage(id: String, completion: @escaping(UIImage) -> Void) {
        
        let storage = Storage.storage()
        let referance = storage.reference()
        let pathRef = referance.child("pictures")
        
        var image: UIImage = UIImage(named: "bell 1")!
        
        let filRef = pathRef.child(id + ".jpeg")
        filRef.getData(maxSize: 1024*1024, completion: {data, error in
            guard error == nil else {completion(image); return}
            image = UIImage (data: data!)!
            completion(image)
        })
        
    }
    
}

struct Post {
    
    let name: String
    let data: String
    let text: String
    let image: UIImage
    
}
