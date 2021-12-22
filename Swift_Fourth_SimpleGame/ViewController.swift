//
//  ViewController.swift
//  Swift_Fourth_SimpleGame
//
//  Created by active on 2020/07/20.
//  Copyright © 2020 activeKJS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BackGround: UIImageView!
    @IBOutlet weak var MajorFish: UIImageView!
    var moveFish:Timer?;
    var mvMount:Int = 0;
    var RanY:Float=0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MajorFish.transform = MajorFish.transform.rotated(by: CGFloat(Double.pi/2 ));
        
        moveFish = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FishMoving), userInfo: nil, repeats: true)
        
        RanY = Float(MajorFish.center.y);
    }
    
    @objc func FishMoving() {
        //print( "물고기 x \(MajorFish.center.x) 물고기 y \(MajorFish.center.y)  그림 \(BackGround.frame.width)");
        //67.0,441.0/117,491
        if(mvMount<Int(BackGround.frame.width)+20){
            mvMount+=1;
            
        }else{
            mvMount=0;
            RanY = Float.random(in: 100 ..< Float(BackGround.frame.height));
        }
        MajorFish.center = CGPoint(x:CGFloat(mvMount), y: CGFloat(RanY));//MajorFish.center.y
        
        //MajorFish.transform=MajorFish.transform.translatedBy(x:CGFloat(100) , y: MajorFish.center.y)
    }
    

    @IBAction func buttonCick(_ sender: Any) {
        moveFish?.invalidate();
    }
    
}

