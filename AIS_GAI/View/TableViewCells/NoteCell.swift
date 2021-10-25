//
//  NoteCell.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit
import RealmSwift

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteDateLabel: UILabel!
    
    // возможно пригодится
    func set(object: NoteModel){
        let df = DateFormatter()
        self.noteTitleLabel.text = object.title
       // self.noteDateLabel.text = df.formatDateToString(dateType: object.date)

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
