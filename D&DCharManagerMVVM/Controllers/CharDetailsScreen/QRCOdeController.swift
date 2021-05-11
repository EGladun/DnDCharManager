//
//  QRCOdeController.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 11.05.2021.
//

import UIKit

class QRCOdeController: BaseController {

    @IBOutlet weak var codeImage: UIImageView!
    
    private var code: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        codeImage.image = code
    }
    
    func loadImage(_ image: UIImage) {
        self.code = image
    }

    @IBAction func closeHandler(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
}
