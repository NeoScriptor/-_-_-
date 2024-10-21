//
//  ViewController.swift
//  x nolik
//
//  Created by Sirojiddin on 08/07/24.
//

import UIKit

class ViewController: UIViewController {

    var sanagich = 0
    
    let lbl = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        let tableGame = UIView()
        tableGame.backgroundColor = .clear//UIColor.init(red: 211/255, green: 175/255, blue: 145/255, alpha: 1)
        tableGame.translatesAutoresizingMaskIntoConstraints = false
        tableGame.clipsToBounds = true
        tableGame.layer.cornerRadius = 2
        view.addSubview(tableGame)
        
        for i in 0...8{
            let btn = UIButton()
            btn.backgroundColor = UIColor.init(red: 120/200, green: 90/130, blue: 70/120, alpha: 1)
            btn.layer.cornerRadius = 10
            btn.setTitle(" ", for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 35)
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 2
            btn.tag = i+1
            btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
            btn.frame = CGRect(x: (10+70)*CGFloat(i%3), y: (70+10)*CGFloat(i/3), width: 70, height: 70)
            tableGame.addSubview(btn)
        }
        
        let restart = UIButton()
        restart.setImage(UIImage(named: "restart"), for: .normal)
        restart.translatesAutoresizingMaskIntoConstraints = false
        restart.tag = 100
        restart.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        view.addSubview(restart)
        
        lbl.text = "X begins"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 24, weight: .semibold)
        view.addSubview(lbl)
        
        NSLayoutConstraint.activate([
            tableGame.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -115),
            tableGame.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -115),
            tableGame.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 115),
            tableGame.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 115),
            
            
            restart.leftAnchor.constraint(equalTo: restart.rightAnchor, constant: -60),
            restart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            restart.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            restart.bottomAnchor.constraint(equalTo: restart.topAnchor, constant: 60),
            
            lbl.leftAnchor.constraint(equalTo: tableGame.centerXAnchor, constant: -80),
            lbl.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            lbl.topAnchor.constraint(equalTo: tableGame.topAnchor, constant: -44),
            lbl.bottomAnchor.constraint(equalTo: tableGame.topAnchor, constant: -10),
            
        ])
        
        
    }
    
    func isWinner() -> Bool {
        let btnTags: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        func checkButtons(_ buttons: [UIButton], title: String) -> Bool {
            return buttons.allSatisfy { $0.title(for: .normal) == title }
        }
        
        func highlightButtons(_ buttons: [UIButton], color: UIColor) {
            for button in buttons {
                button.backgroundColor = color
            }
        }
        
        let buttons = btnTags.map { tag in
            return view.viewWithTag(tag) as! UIButton
        }
        
        // check if x wins
        if checkButtons([buttons[0], buttons[1], buttons[2]], title: "𝓍") {
            highlightButtons([buttons[0], buttons[1], buttons[2]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[0], buttons[4], buttons[8]], title: "𝓍") {
            highlightButtons([buttons[0], buttons[4], buttons[8]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[0], buttons[3], buttons[6]], title: "𝓍") {
            highlightButtons([buttons[0], buttons[3], buttons[6]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[1], buttons[4], buttons[7]], title: "𝓍") {
            highlightButtons([buttons[1], buttons[4], buttons[7]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[3], buttons[4], buttons[5]], title: "𝓍") {
            highlightButtons([buttons[3], buttons[4], buttons[5]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[6], buttons[7], buttons[8]], title: "𝓍") {
            highlightButtons([buttons[6], buttons[7], buttons[8]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[2], buttons[4], buttons[6]], title: "𝓍") {
            highlightButtons([buttons[2], buttons[4], buttons[6]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[2], buttons[5], buttons[8]], title: "𝓍") {
            highlightButtons([buttons[2], buttons[5], buttons[8]], color: UIColor.green)
            return true
        //check if 0 wins
        }else if checkButtons([buttons[0], buttons[1], buttons[2]], title: "０") {
            highlightButtons([buttons[0], buttons[1], buttons[2]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[0], buttons[4], buttons[8]], title: "０") {
            highlightButtons([buttons[0], buttons[4], buttons[8]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[0], buttons[3], buttons[6]], title: "０") {
            highlightButtons([buttons[0], buttons[3], buttons[6]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[1], buttons[4], buttons[7]], title: "０") {
            highlightButtons([buttons[1], buttons[4], buttons[7]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[3], buttons[4], buttons[5]], title: "０") {
            highlightButtons([buttons[3], buttons[4], buttons[5]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[6], buttons[7], buttons[8]], title: "０") {
            highlightButtons([buttons[6], buttons[7], buttons[8]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[2], buttons[4], buttons[6]], title: "０") {
            highlightButtons([buttons[2], buttons[4], buttons[6]], color: UIColor.green)
            return true
        }else if checkButtons([buttons[2], buttons[5], buttons[8]], title: "０") {
            highlightButtons([buttons[2], buttons[5], buttons[8]], color: UIColor.green)
            return true
        }
        
        return false
    }

    func restart(){
        sanagich = 0
        for i in 0...8{
            let btn = view.viewWithTag(i+1) as! UIButton
            btn.setTitle(" ", for: .normal)
            btn.backgroundColor = .lightGray
            lbl.text = "X begins"
            btn.layer.cornerRadius = 10
            btn.backgroundColor = UIColor.init(red: 150/255, green: 70/255, blue: 30/255, alpha: 1)
        }
    }
    
    @objc func clickBtn(_ sender: UIButton){
        print(sender.tag)
        let btn = view.viewWithTag(sender.tag) as! UIButton
        if btn.title(for: .normal) == " " {
            sanagich += 1
            if sanagich%2 == 1{
                btn.setTitle("𝓍", for: .normal)
                lbl.text = "0's turn"
                btn.layer.cornerRadius = 0
            }else{
                btn.setTitle("０", for: .normal)
                lbl.text = "X's turn"
                btn.layer.cornerRadius = 25
            }
        }
        let text = btn.title(for: .normal)
        let iswinner = isWinner()
        if iswinner == true {
            
            let alertController = UIAlertController(title: "\(text ?? "X") got the luck this time", message: "Congratulations to \(text ?? "X")!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Cancel", style: .destructive) { _ in
                print("restart clicked")
            }
            let action2 = UIAlertAction(title: "Restart", style: .default) { _ in
                print("restart clicked!")
                self.restart()
            }
            
            alertController.addAction(action1)
            alertController.addAction(action2)
            present(alertController, animated: true)
        }
        if sender.tag == 100{
            restart()
        }
    }
    


}

