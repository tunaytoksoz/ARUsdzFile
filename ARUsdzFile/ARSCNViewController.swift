//
//  ARSCNViewController.swift
//  ARUsdzFile
//
//  Created by Tunay Toksöz on 27.06.2022.
//

import Foundation
import UIKit
import SceneKit
import ARKit
import SceneKit.ModelIO
import QuickLook


class ARSCNViewController: UIViewController, ARSCNViewDelegate /*, QLPreviewControllerDelegate, QLPreviewControllerDataSource*/{

    
    @IBOutlet weak var sceneView: ARSCNView!
    var usdzPath :URL = Bundle.main.url(forResource: "AirForce", withExtension: "usdz")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(usdzPath.lastPathComponent)
      //  let mdlAsset = MDLAsset(url: usdzPath)
       // mdlAsset.loadTextures()
        let scene = SCNScene()
       
        let refNode = SCNReferenceNode(url: usdzPath)
        
        refNode?.position = SCNVector3(0, -0.1, -0.25)
        refNode?.load()
        
        refNode?.scale = SCNVector3(0.01, 0.01, 0.01)
        scene.rootNode.addChildNode(refNode!)
        
        
        sceneView.scene = scene
        
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        
        sceneView!.allowsCameraControl = true
        
      
        
       
  
     /*   let previewController = QLPreviewController()
        // 2
        previewController.dataSource = self
        previewController.delegate = self
        // 3
        present(previewController, animated: false)
    */
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
       sceneView.session.pause()
    }
    
    
    
   /* func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = usdzPath
        
        return url as QLPreviewItem
    }*/
    
    
}
