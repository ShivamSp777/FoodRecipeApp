
import Foundation

// MARK: - APIManager

class APIManager {

     func getDataFromApi(_ url: String, completionHandler: @escaping (Result<RecipeBase, Error>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { userData, userResponse,
            error in
            if error == nil {
                if let userData = userData {
                    do {
                        let jsonData = try JSONDecoder().decode(RecipeBase.self, from: userData)
                        completionHandler(.success(jsonData))
                    } catch (let error) {
                        completionHandler(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
