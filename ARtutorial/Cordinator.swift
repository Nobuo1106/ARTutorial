//
//  Cordinator.swift
//  ARtutorial
//
//  Created by apple on 2022/10/08.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        print("updateUIView")
        guard let view = self.view else { return }
        let tapLocation = recognizer.location(in: view)
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first {
            let anchor = AnchorEntity(raycastResult: result)
            
            cancellable = ModelEntity.loadAsync(named: "shoe")
                .sink{ loadCompletion in
                    if case let .failure(error) = loadCompletion {
                        print("Unable to load model \(error)")
                    }
                    
                    self.cancellable?.cancel()
                        
                } receiveValue: { entity in
                    anchor.addChild(entity)
                }
                    view.scene.addAnchor(anchor)
                }
        }
    }
