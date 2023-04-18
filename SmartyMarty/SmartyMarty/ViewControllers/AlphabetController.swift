//
//  AlphabetController.swift
//  SmartyMarty
//
//  Created by Ziang Wang on 2023-04-10.
//

import UIKit

class AlphabetController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    let a : Alphabet = .init()
    let b : Alphabet = .init()
    let c : Alphabet = .init()
    let d : Alphabet = .init()
    let e : Alphabet = .init()
    let f : Alphabet = .init()
    let g : Alphabet = .init()
    let h : Alphabet = .init()
    let i : Alphabet = .init()
    let j : Alphabet = .init()
    let k : Alphabet = .init()
    let l : Alphabet = .init()
    let m : Alphabet = .init()
    let n : Alphabet = .init()
    let o : Alphabet = .init()
    let p : Alphabet = .init()
    let q : Alphabet = .init()
    let r : Alphabet = .init()
    let s : Alphabet = .init()
    let t : Alphabet = .init()
    let u : Alphabet = .init()
    let v : Alphabet = .init()
    let w : Alphabet = .init()
    let x : Alphabet = .init()
    let y : Alphabet = .init()
    let z : Alphabet = .init()
   
    
    var al:[Alphabet] = []

    func getAlph(){
        a.initWithData(alph: "A a")
        b.initWithData(alph: "B b")
        c.initWithData(alph: "C c")
        d.initWithData(alph: "D d")
        e.initWithData(alph: "E e")
        f.initWithData(alph: "F f")
        g.initWithData(alph: "G g")
        h.initWithData(alph: "H h")
        i.initWithData(alph: "I i")
        j.initWithData(alph: "J j")
        k.initWithData(alph: "K k")
        l.initWithData(alph: "L l")
        m.initWithData(alph: "M m")
        n.initWithData(alph: "N n")
        o.initWithData(alph: "O o")
        p.initWithData(alph: "P p")
        q.initWithData(alph: "Q q")
        r.initWithData(alph: "R r")
        s.initWithData(alph: "S s")
        t.initWithData(alph: "T t")
        u.initWithData(alph: "U u")
        v.initWithData(alph: "V v")
        w.initWithData(alph: "W w")
        x.initWithData(alph: "X x")
        y.initWithData(alph: "Y y")
        z.initWithData(alph: "Z z")
        al =  [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]
    }
    override func viewDidLoad() {
        getAlph()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return al.count
    }

    // define table method for cell thickness
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // define table method for how each cell should look
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")

        //populate the cell
        let rowNum = indexPath.row
        let alph = "\(al[rowNum].alph ?? "")"
       // let imgName = UIImage(named:imageData[rowNum])

        tableCell.primaryLabel.text =  alph

        tableCell.myImageView.image = UIImage(named: alph + ".png")
        tableCell.accessoryType = .disclosureIndicator

        //return the cell
        return tableCell

    }


    // define the table method for clicking on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // in AppDelegate define a string called selectedURL
        let rowNum = indexPath.row
        let a = al[rowNum].alph!
        
        
        
        SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        let alertController = UIAlertController(title: "Playing sound for ", message: a, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        //SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
