//
//  GameCode.swift
//  Swift_Fourth_SimpleGame
//
//  Created by active on 2020/07/20.
//  Copyright © 2020 activeKJS. All rights reserved.
//

import UIKit
class GameCode: UIViewController{
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var Player: UIImageView!
    @IBOutlet weak var StartText: UILabel!
    @IBOutlet weak var ScroeLabel: UILabel!

    //장애물
    @IBOutlet weak var Redball: UIImageView!
    @IBOutlet weak var Blueball: UIImageView!
    @IBOutlet weak var Yellowball: UIImageView!
    @IBOutlet weak var Greenball: UIImageView!

    var timer:Timer?;
    var Score:Float = 0;
    override func viewDidLoad() {
         super.viewDidLoad()
        VisibleControl(start: false);
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        VisibleControl(start: true);
        if(timer==nil){//안하면 가속도 생김
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameTime), userInfo: nil, repeats: true)
            
        }
        let touch = touches.first!
        let Plocation = touch.location(in: touch.view)
        Player.center = CGPoint(x:Plocation.x, y: Background.frame.height-50)
    }
    @objc func GameTime() {
        BallMovement(ball: Redball, movement: 3.5)
        BallMovement(ball: Blueball, movement: 6)
        BallMovement(ball: Yellowball, movement: 2.25)
        BallMovement(ball: Greenball, movement: 4.75)
        Score += 1;
        
        ScroeLabel.text = String(format: "Run : %.2f Km", Score/100)
        
        if(Score/100>15){
            //Go clear
            timer?.invalidate()
            
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController = storyboard.instantiateViewController(withIdentifier: "happy")
            self.present(nextController,animated: true,completion: nil);
        }
        
    }
    func VisibleControl(start:Bool)  {
        if(start){
            StartText.isHidden = true;
            
            Player.isHidden = false;
            ScroeLabel.isHidden = false;
            
            Redball.isHidden = false;
            Blueball.isHidden = false;
            Yellowball.isHidden = false;
            Greenball.isHidden = false;
        }
        else{
            StartText.isHidden = false;
            
            Player.isHidden = true;
            ScroeLabel.isHidden = true;
            
            Redball.isHidden = true;
            Blueball.isHidden = true;
            Yellowball.isHidden = true;
            Greenball.isHidden = true;
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let Plocation = touch.location(in: touch.view)
        print("물고기 x \(Plocation.x) y \(Plocation.y)")
        Player.center = CGPoint(x:Plocation.x, y: Background.frame.height-50)
    }
    
    func BallMovement (ball:UIImageView , movement:Float) {
        var ballX:Float = Float(ball.center.x);
        var ballY:Float = Float(ball.center.y);
        
        
        if (ball.frame.intersects(Player.frame)) {
            
            
            if(ballY<Float( Player.center.y)){
                timer?.invalidate()
                //GameOver
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController = storyboard.instantiateViewController(withIdentifier: "sad")
            
            self.present(nextController,animated: true,completion: nil);
            }
            
        }
        
        //공 움직임
        if(ballY<Float(Background.frame.height)+(Float(ball.frame.width)/2)){
            ballY+=movement;
        }
        else{
            ballY = -(Float(ball.frame.width)/2);
            ballX = Float.random(in:30..<Float(Background.frame.width))
        }
        
        ball.center = CGPoint(x:CGFloat(ballX) ,y:CGFloat(ballY));
        
    }
}
