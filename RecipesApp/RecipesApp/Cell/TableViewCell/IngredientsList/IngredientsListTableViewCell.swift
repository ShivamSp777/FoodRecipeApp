
import UIKit

class IngredientsListTableViewCell: UITableViewCell {
    
    static let identifire = String(describing: IngredientsListTableViewCell.self)
    
    @IBOutlet weak var IngredientsImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(category: Meals){
        IngredientsImage.sd_setImage(with: URL(string: category.strMealThumb ?? ""), placeholderImage: UIImage(named: "food.png"))
        nameLabel.text = category.strMeal
        qtyLabel.text = category.strCategory
    
    }
    
}
