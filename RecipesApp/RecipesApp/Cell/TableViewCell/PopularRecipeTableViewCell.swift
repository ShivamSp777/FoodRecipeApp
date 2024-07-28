
import UIKit
import SDWebImage

class PopularRecipeTableViewCell: UITableViewCell {
    
    // MARK: - IBoutlets Properties
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleName: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var IngredientsCollectionView: UICollectionView! {
        didSet {
            IngredientsCollectionView.dataSource = self
            IngredientsCollectionView.delegate = self
        }
    }
    
    var ingredients: [String] = []
    var meal: Meals?
    
    static let identifire = String(describing: PopularRecipeTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func registerCell(){
        IngredientsCollectionView.register(UINib(nibName: IngredientsCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifire)
    }
    
    func setup(category: Meals){
        recipeImageView.sd_setImage(with: URL(string: category.strMealThumb ?? ""), placeholderImage: UIImage(named: "food.png"))
        recipeTitleName.text = category.strMeal
        recipeDescriptionLabel.text = category.strInstructions
        ingredients = category.ingredients 
        IngredientsCollectionView.reloadData()
    }
}

extension PopularRecipeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifire, for: indexPath) as! IngredientsCollectionViewCell
        let ingredient = ingredients[indexPath.item]
        let url = "\(APIConstants.imageBaseUrl)\(ingredient).png"
        cell.IngredientsLabel.text = ingredient
        cell.IngredientsImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "food.png"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 3)
        return CGSize(width: width, height: 120)
    }
}
