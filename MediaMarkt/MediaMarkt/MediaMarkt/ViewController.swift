//
//  ViewController.swift
//  MediaMarkt
//
//  Created by SantiMac on 30.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListe = [Urunler]()
    
    
    override func viewDidLoad() {
        
    
        super.viewDidLoad()
        
        
        if let tabItems = tabBarController?.tabBar.items {
            let item = tabItems[2]
            item.badgeValue = "3"
        }
        
        let appearance = UITabBarAppearance()
         
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        let resim = UIImage(named: "navBaslik")
        self.navigationItem.titleView = UIImageView(image: resim)
        
        
        let u1 = Urunler(id: 1, ad: "", resim: "urunResim1", fiyat: 30599)
        let u2 = Urunler(id: 2, ad: "", resim: "urunResim2", fiyat: 30599)
        urunlerListe.append(u1)
        urunlerListe.append(u2)
        
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunHucre") as!
        UrunTableViewCell
        
        let urun = urunlerListe[indexPath.row]
        
        hucre.urunAdLabel.text = urun.ad
        hucre.urunFiyatLabel.text = "\(urun.fiyat!),-"
        hucre.urunImageView.image = UIImage(named: urun.resim!)
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListe[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            contextualAction,view,bool in
            print("\(urun.ad!) silindi")
            
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Duzenle") {
            contextualAction,view,bool in
            print("\(urun.ad!) duzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Urunler {
                let vc = segue.destination as! DetaySayfa
                vc.urun = urun
                
                
        }
        }
    }
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        //Seçili durum
        itemAppearance.selected.iconColor = UIColor.systemRed
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
      
        //Seçili olmayan durum
        itemAppearance.normal.iconColor = UIColor.systemGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
    }
    
    }
