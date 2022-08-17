
@testable import Coles
import XCTest
import Coles

class RecipeViewModelTest: XCTestCase {
   
    var viewModel = RecipeViewModel()
   
    func test_getRecipesFromLocalJson() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipesSample") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewModel.recipes.count , 8)
    }
    
    func test_generateRecipeViewModels_ifUserIsInPortrait() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipesSample") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        viewModel.generateRecipeViewModels(isLandScape: false)
        XCTAssertEqual(viewModel.recipeViewModel.count , 5)
    }
    
    func test_generateRecipeViewModels_ifUserIsInLandScape() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipesSample") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        viewModel.generateRecipeViewModels(isLandScape: true)
        XCTAssertEqual(viewModel.recipeViewModel.count , 8)
    }
    
    func test_jsonfileDoesNotexist() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipSample") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        viewModel.generateRecipeViewModels(isLandScape: true)
        XCTAssertEqual(viewModel.recipeViewModel.count , 0)
    }
    
    func test_generateRecipeViewModels_ifCountIsZero() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipSample") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        viewModel.generateRecipeViewModels(isLandScape: false)
        XCTAssertEqual(viewModel.recipeViewModel.count , 0)
    }
    
    func test_generateRecipeViewModels_IfDataIsInWrongFromat() {
        let expectation = expectation(description: "Data is loaded")
        viewModel.getRecipes(fileName: "recipesSampleWrongFormat") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
        viewModel.generateRecipeViewModels(isLandScape: false)
        XCTAssertEqual(viewModel.recipeViewModel.count , 0)
    }
}

