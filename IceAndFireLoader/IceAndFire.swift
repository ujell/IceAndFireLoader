//
//  IceAndFire.swift
//  AnApiOfIceAndFireSwiftWrapper
//
//  Created by Yücel Uzun on 13/02/16.
//  Copyright © 2016 Yücel Uzun. All rights reserved.
//

import Foundation

private class IceAndFireParser {
    
    class func isDictionaryValid (dictionary: [String: AnyObject], type: IceAndFire.Resource) -> Bool{
        if dictionary.count == 0 || dictionary["url"] == nil { return false }
        if (type == IceAndFire.Resource.Book) {
            return dictionary ["name"] != nil &&
                dictionary ["isbn"] != nil &&
                dictionary ["authors"] != nil &&
                dictionary ["numberOfPages"] != nil &&
                dictionary ["publisher"] != nil &&
                dictionary ["country"] != nil &&
                dictionary ["mediaType"] != nil &&
                dictionary ["released"] != nil &&
                dictionary ["characters"] != nil &&
                dictionary ["povCharacters"] != nil
        }
        return true
    }
    
    class func stringFromDictionary (dictionary: [String: AnyObject], key: String) -> String? {
        if let string = dictionary[key] as? String where string != "" {
            return string
        }
        return nil
    }
    
    class func urlFromDictionary (dictionary: [String: AnyObject], key: String) -> NSURL? {
        if let string = dictionary[key] as? String where string != "" {
            return NSURL(string: string)
        }
        return nil
    }
    
    class func intFromDictionary (dictionary: [String: AnyObject], key: String) -> Int? {
        if let number = dictionary[key] as? Int {
            return number
        }
        return nil
    }
    
    class func dateFromDictionary (dictionary: [String: AnyObject], key: String) -> NSDate? {
        if let dateString = dictionary[key] as? String {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return formatter.dateFromString(dateString)
        }
        return nil
    }
    
    class func stringArrayFromDictionary (dictionary: [String: AnyObject], key: String) -> [String]? {
        if let array = dictionary[key] as? [String] where array.count > 0 {
            return array
        }
        return nil
    }
    
    class func urlArrayFromDictionary (dictionary: [String: AnyObject], key: String) -> [NSURL]? {
        if let array = dictionary[key] as? [String] where array.count > 0 {
            return array.map() { return NSURL(string: $0)! }
        }
        return nil
    }
}

public protocol IceAndFireObject {
    static var type : IceAndFire.Resource {get}
    init? (dictionary: [String:AnyObject])
}

/**
 Represents character resource.
 For field details please check [api documentation](https://anapioficeandfire.com/Documentation#characters)
 */
public struct IceAndFireCharacter: IceAndFireObject {
    public static let type = IceAndFire.Resource.Character
    public let url: NSURL
    public let name: String?
    public let culture: String?
    public let born: String?
    public let died: String?
    public let titles: [String]?
    public let aliases: [String]?
    public let father: NSURL?
    public let mother: NSURL?
    public let spouse: NSURL?
    public let allegiances: [String]?
    public let books: [NSURL]?
    public let povBooks: [NSURL]?
    public let tvSeries: [String]?
    public let playedBy: [String]?
    
    public init? (dictionary: [String: AnyObject]) {
        guard IceAndFireParser.isDictionaryValid(dictionary, type: .Character) else {
            url = NSURL()
            name = nil
            culture = nil
            born = nil
            died = nil
            titles = nil
            aliases = nil
            father = nil
            mother = nil
            spouse = nil
            allegiances = nil
            books = nil
            povBooks = nil
            tvSeries = nil
            playedBy = nil
            return nil
        }
        
        url = IceAndFireParser.urlFromDictionary(dictionary, key: "url")!
        name = IceAndFireParser.stringFromDictionary (dictionary, key: "name")
        culture = IceAndFireParser.stringFromDictionary (dictionary, key: "culture")
        born = IceAndFireParser.stringFromDictionary (dictionary, key: "born")
        died = IceAndFireParser.stringFromDictionary (dictionary, key: "died")
        titles = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "titles")
        aliases = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "aliases")
        father = IceAndFireParser.urlFromDictionary(dictionary, key: "father")
        mother = IceAndFireParser.urlFromDictionary(dictionary, key: "mother")
        spouse = IceAndFireParser.urlFromDictionary(dictionary, key: "spouse")
        allegiances = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "allegiances")
        books = IceAndFireParser.urlArrayFromDictionary(dictionary, key: "books")
        povBooks = IceAndFireParser.urlArrayFromDictionary(dictionary, key: "povBooks")
        tvSeries = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "tvSeries")
        playedBy = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "playedBy")
    }
}

/**
 Represents book resource.
 For field details please check [api documentation](https://anapioficeandfire.com/Documentation#books)
 */
public struct IceAndFireBook: IceAndFireObject {
    public static let type = IceAndFire.Resource.Book
    public let url: NSURL
    public let name: String
    public let isbn: String
    public let authors : [String]
    public let numberOfPages: Int
    public let publisher: String
    public let country: String
    public let mediaType: String
    public let released: NSDate
    public let characters: [NSURL]
    public let povCharacters: [NSURL]
    
    public init? (dictionary: [String: AnyObject]) {
        guard IceAndFireParser.isDictionaryValid(dictionary, type: .Book) else {
            url = NSURL()
            name = ""
            isbn = ""
            authors = [String]()
            numberOfPages = 0
            publisher = ""
            country = ""
            mediaType = ""
            released = NSDate()
            characters = [NSURL]()
            povCharacters = [NSURL]()
            return nil
        }
        
        url = IceAndFireParser.urlFromDictionary(dictionary, key: "url")!
        name = IceAndFireParser.stringFromDictionary (dictionary, key: "name")!
        isbn = IceAndFireParser.stringFromDictionary (dictionary, key: "isbn")!
        authors = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "authors")!
        numberOfPages = IceAndFireParser.intFromDictionary(dictionary, key: "numberOfPages")!
        publisher = IceAndFireParser.stringFromDictionary (dictionary, key: "publisher")!
        country = IceAndFireParser.stringFromDictionary (dictionary, key: "country")!
        mediaType = IceAndFireParser.stringFromDictionary (dictionary, key: "mediaType")!
        released = IceAndFireParser.dateFromDictionary(dictionary, key: "released")!
        characters = IceAndFireParser.urlArrayFromDictionary(dictionary, key: "characters")!
        povCharacters = IceAndFireParser.urlArrayFromDictionary(dictionary, key: "povCharacters")!
    }
}

/**
 Represents house resource.
 For field details please check [api documentation](https://anapioficeandfire.com/Documentation#houses)
 */
public struct IceAndFireHouse: IceAndFireObject {
    public static let type = IceAndFire.Resource.House
    public let url: NSURL
    public let name: String?
    public let region: String?
    public let coatOfArms: String?
    public let words: String?
    public let titles: [String]?
    public let seats: [String]?
    public let currentLord: NSURL?
    public let heir: NSURL?
    public let overlord: NSURL?
    public let founded: String?
    public let founder: NSURL?
    public let diedOut: String?
    public let ancestralWeapons: [String]?
    public let cadetBranches: [String]?
    public let swornMembers: [String]?
    
    public init? (dictionary: [String: AnyObject]) {
        guard IceAndFireParser.isDictionaryValid(dictionary, type: .House) else {
            url = NSURL()
            name = nil
            region = nil
            coatOfArms = nil
            words = nil
            titles = nil
            seats = nil
            currentLord = nil
            heir = nil
            overlord = nil
            founded = nil
            founder = nil
            diedOut = nil
            ancestralWeapons = nil
            cadetBranches = nil
            swornMembers = nil
            return nil
        }
        
        url = IceAndFireParser.urlFromDictionary(dictionary, key: "url")!
        name = IceAndFireParser.stringFromDictionary (dictionary, key: "name")
        region = IceAndFireParser.stringFromDictionary (dictionary, key: "region")
        coatOfArms = IceAndFireParser.stringFromDictionary (dictionary, key: "coatOfArms")
        words = IceAndFireParser.stringFromDictionary (dictionary, key: "words")
        titles = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "titles")
        seats = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "seats")
        currentLord = IceAndFireParser.urlFromDictionary(dictionary, key: "currentLord")
        heir = IceAndFireParser.urlFromDictionary(dictionary, key: "heir")
        overlord = IceAndFireParser.urlFromDictionary(dictionary, key: "overlord")
        founded = IceAndFireParser.stringFromDictionary (dictionary, key: "founded")
        founder = IceAndFireParser.urlFromDictionary(dictionary, key: "founder")
        diedOut = IceAndFireParser.stringFromDictionary (dictionary, key: "diedOut")
        ancestralWeapons = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "ancestralWeapons")
        cadetBranches = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "cadetBranches")
        swornMembers = IceAndFireParser.stringArrayFromDictionary(dictionary, key: "swornMembers")
    }
}

public class IceAndFire {
    
    static private let apiUrl = "https://anapioficeandfire.com/api/"
    
    public enum Resource: String {
        case Book = "books", Character = "characters", House = "houses"
    }
    
    public enum Error: ErrorType {
        case ParseError(String), LoadError(String)
    }
    
    
    /**
     Loads the resource with given ID and calls completion handler.
     Uses type of first variable in completition handler to decide what to load.
     ```swift
     IceAndFire.load (2) { (character: IceAndFireCharacter?, error: IceAndFire.Error?) in
        if character != nil {
            print (character!.name)
        } else if error != nil {
            print (error!)
        }
     }
     */
    public class func load <T:IceAndFireObject> (id: Int, completionHandler: (T?, Error?) -> ()) {
        let url = NSURL(string: apiUrl + T.type.rawValue + "/\(id)")!
        load(url) { result, error in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            if let dictionary = result as? [String: AnyObject], let object = T(dictionary: dictionary) {
                completionHandler (object, nil)
            } else {
                completionHandler (nil, .ParseError("An error happened while parsing the API data"))
            }
        }
    }
    
    /**
     Loads the bulk of resource for given page with given size nad calls completition handler.
     Uses type of first variable in completition handler to decide what to load.
     Right now only way to understand if it's last page is checking if there's result.
     ```swift
     IceAndFire.load(5, pageSize: 10) { (characters:[IceAndFireCharacter]?, error) in
        guard error == nil else {
            print (error!)
            return
        }
        if characters != nil {
            for character in characters! where character.name != nil {
                print (character.name)
            }
        }
     }
     */
    public class func load <T:IceAndFireObject> (page: Int, pageSize: Int, completionHandler: ([T]?, Error?) -> ()) {
        var pageSize = pageSize
        if pageSize > 50 {
            print ("Page size can be maximum 50, 50 is used.")
            pageSize = 50
        }
        let url = NSURL(string: apiUrl + T.type.rawValue + "?page=\(page)&pageSize=\(pageSize)")!
        load (url) { result, error in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            if let rawArray = result as? [[String:AnyObject]] {
                var array = [T]()
                for dictionary in rawArray {
                    if let object = T (dictionary: dictionary) {
                        array.append(object)
                    } else {
                        completionHandler (nil, .ParseError("An error happened while parsing the API data"))
                    }
                }
                completionHandler (array, nil)
            }
        }
    }
    
    private class func load (url: NSURL, completionHandler: (AnyObject?, Error?) -> ()) {
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url) {data, response, error in
            guard error == nil else {
                completionHandler(nil, .LoadError(error!.description))
                return
            }
            if let httpResponse = response as? NSHTTPURLResponse where httpResponse.statusCode != 200 {
                let code = "\(httpResponse.statusCode)"
                let message = NSHTTPURLResponse.localizedStringForStatusCode(httpResponse.statusCode)
                completionHandler(nil, .LoadError(code + " " + message))
                return
            }
            
            guard data != nil else {
                completionHandler (nil, .LoadError ("API didn't return any data"))
                return
            }
            do {
                if let jsonDic = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? [String: AnyObject] {
                    completionHandler (jsonDic, nil)
                } else  if let jsonArray = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? [[String: AnyObject]] {
                    completionHandler (jsonArray, nil)
                } else {
                    completionHandler (nil, .ParseError("Returned JSON from API was not valid"))
                }
            } catch {
                completionHandler (nil, .ParseError("Returned JSON from API was not valid"))
            }
            }.resume()
    }
}
