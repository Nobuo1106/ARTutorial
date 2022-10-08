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
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first {
            let anchor = ARAnchor(name: "Plane Anchor", transform: result.worldTransform)
            view.session.add(anchor: anchor)
            
            let modelEntity =  ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
            
            let anchorEntity = AnchorEntity(anchor: anchor)
            anchorEntity.addChild(modelEntity)
            view.scene.addAnchor(anchorEntity)
        }
    }
}
