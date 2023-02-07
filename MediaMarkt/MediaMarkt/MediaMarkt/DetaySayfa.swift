//
//  DetaySayfa.swift
//  MediaMarkt
//
//  Created by SantiMac on 31.01.2023.
//

import UIKit

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var urunResim: UIImageView!
    
    @IBOutlet weak var urunAdi: UILabel!
    
    @IBOutlet weak var urunAciklamasi: UILabel!
    @IBOutlet weak var urunKodu: UILabel!
    
    @IBOutlet weak var urunFiyati: UILabel!
    
    @IBOutlet weak var urunRenk: UILabel!
    
    @IBOutlet weak var urunBellek: UILabel!
    
    
    var urun:Urunler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        if let u = urun {
            self.navigationItem.title = u.ad
            urunResim.image = UIImage(named: u.resim!)
            urunFiyati.text = "\(u.fiyat!),-"
        }
    }
    
    @IBAction func buttonStoktanGonderi(_ sender: Any) {
    }
    @IBAction func buttonEskiCihaziniYenile(_ sender: Any) {
    }
    @IBAction func buttonMagazadanTeslimAl(_ sender: Any) {
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u = urun {
            print("Detay Sayfa : \(u.ad!)) sepete eklendi")
    
        }
    }
    
}
