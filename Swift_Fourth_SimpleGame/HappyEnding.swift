//
//  HappyEnding.swift
//  Swift_Fourth_SimpleGame
//
//  Created by active on 2020/07/21.
//  Copyright © 2020 activeKJS. All rights reserved.
//

import UIKit

class HappyEnding: UIViewController {
    @IBOutlet weak var Momfish: UIImageView!
    @IBOutlet weak var Childfish: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Momfish.transform = Momfish.transform.rotated(by: CGFloat(Double.pi/2));
        Childfish.transform = Childfish.transform.rotated(by: CGFloat(Double.pi/2));
        
    }
}
