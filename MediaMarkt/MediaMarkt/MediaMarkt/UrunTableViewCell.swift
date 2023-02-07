//
//  UrunTableViewCell.swift
//  MediaMarkt
//
//  Created by SantiMac on 30.01.2023.
//

import UIKit

class UrunTableViewCell: UITableViewCell {
    @IBOutlet weak var arkaPlan: UIView!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
    }
    
}
