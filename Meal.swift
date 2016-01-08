import UIKit

class Meal: NSObject, NSCoding {
    
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Types
    
    struct PropertyKey{
    
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        
    }
    
    //MARK: Initialisation
    
    init?(name: String, photo: UIImage?, rating: Int){
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0{
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)                      //this method encodes any type of object
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)                 //this method encodes an integer
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        //the initialiser decodes the encoded data
        //required means it must be implemented on every subclass of the class that defines this initialiser
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        //because the photo is optional use ? downcast
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        //must call designated initialiser 
        self.init(name: name, photo: photo, rating: rating)
    }
}