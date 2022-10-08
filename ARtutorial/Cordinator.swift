//
//  Cordinator.swift
//  ARtutorial
//
//  Created by apple on 2022/10/08.
//

import Foundation
import ARKit
import RealityKit

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        print("updateUIView")
        guard let view = self.view else { return }
        let tapLocation = recognizer.location(in: view)
        if let entity = view.entity(at: tapLocation) as? ModelEntity {
            let materal = SimpleMaterial(color: .yellow, isMetallic: true)
            entity.model?.materials = [materal]
        }
    }
}
