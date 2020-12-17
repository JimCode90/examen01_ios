
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var imagenProducto: UIImageView!
    @IBOutlet weak var textoProducto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
