

import UIKit

class IngredientsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBoutlets Properties 
    @IBOutlet weak var IngredientsImage: UIImageView!
    @IBOutlet weak var IngredientsLabel: UILabel!
    
    static let identifire = String(describing: IngredientsCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
