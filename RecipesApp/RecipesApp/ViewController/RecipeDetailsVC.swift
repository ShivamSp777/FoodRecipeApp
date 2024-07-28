
import UIKit

class RecipeDetailsVC: UIViewController {
    
    // MARK: - IBoutlets properties
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var RecipeDetailsTableView: UITableView!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    // MARK: - Instance properties
    var meals: [Meals] = []
    var mealsData: Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeCell()
        initialSetup()
    }
    
    
    // MARK: - Register cell
    private func registeCell() {
        RecipeDetailsTableView.register(UINib(nibName: IngredientsListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: IngredientsListTableViewCell.identifire)
    }
    
    private func initialSetup() {
        dishImage.sd_setImage(with: URL(string: mealsData?.strMealThumb ?? ""), placeholderImage: UIImage(named: "food.png"))
        recipeTitleLabel.text = mealsData?.strCategory
        recipeDescriptionLabel.text = mealsData?.strInstructions
    }
    
    @IBAction func viewOnYoutubeButton(_ sender: UIButton) {
        self.openYouTubeLink(urlString: mealsData?.strYoutube ?? "")
        
    }
    
    private func openYouTubeLink(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: - UITableViewDataSource method
extension RecipeDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsListTableViewCell.identifire, for: indexPath) as? IngredientsListTableViewCell
        let data = meals[indexPath.row]
        cell?.setup(category: data)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}
