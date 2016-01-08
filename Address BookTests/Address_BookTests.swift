import XCTest
import UIKit
@testable import Address_Book

class Address_BookTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialisation(){
        
        //Success case
        let potentialItem = Meal(name: "Potato", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure case
        let noName = Meal(name: "" , photo: nil, rating: 0)
        XCTAssertNil(noName)
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
        
    }
    
}
