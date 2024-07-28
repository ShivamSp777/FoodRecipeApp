

import UIKit

class PopularRecipesVC: UIViewController {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var specialsMeals: [Meals] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registeCell()
        self.fetchingDataFromAPI()
    }
    
    // MARK: - Register cell
    private func registeCell() {
        recipeTableView.register(UINib(nibName: PopularRecipeTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: PopularRecipeTableViewCell.identifire)
    }
    
    private func fetchingDataFromAPI() {
        
        APIManager().getDataFromApi(APIConstants.recipeUrl) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.specialsMeals = data.meals ?? []
                DispatchQueue.main.async {
                    self.recipeTableView.reloadData()
                }
            case .failure(let failure):
                print("failure: ", failure)
            }
        }
        
    }
}


// MARK: - UITableViewDataSource method
extension PopularRecipesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return specialsMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularRecipeTableViewCell.identifire, for: indexPath) as? PopularRecipeTableViewCell
        let data = specialsMeals[indexPath.row]
        cell?.setup(category: data)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = RecipeDetailsVC.instantiate()
        controller.meals = specialsMeals
        controller.mealsData = specialsMeals[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}



