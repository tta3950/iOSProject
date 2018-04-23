//
//  Model.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 3/14/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import Foundation
import CoreLocation
import Parse
/**
 Current use of the UserModel Class should be for User Authentication,
 User Interactions with the app, and provide an interface for connecting
 to a database.
 */
class UserModel {
    static let instance = UserModel()
    private var _userLocation = CLLocation()
    private var _user:User = User()
    
    public var userLocation:CLLocation {get{return _userLocation}}
    public var userAccount:User{get{return _user}}
    public var riderArray:[Rider] = []

    private init() {}
    
    public func setUserLocation(_ location:CLLocation){
        _userLocation = location
    }
    public func fetchRiders(){
        let innerQuery = PFQuery(className: "Session")
        innerQuery.whereKeyExists("user)")
        let query = PFQuery(className: "User")
        query.whereKey("objectId", matchesQuery: innerQuery)
        query.whereKey("Rider", equalTo: "True")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                var riders:[Rider] = []
                for object in objects!{
                    riders.append(Rider(name:object["Name"] as! String, location:object["Location"] as! String
                        ,destination:object["Destination"] as! String))
                }
                UserModel.instance.riderArray = riders
            } else {
                //error has occured
                                
            }
            
        }
    }
    public func signUpAsUser(_ firstName:String, _ lastName:String, _ emailAddress:String, _ password:String){
        let user = PFUser()
        user.username = emailAddress
        user.password = password
        user.email = emailAddress
        user.setObject("\(firstName) \(lastName)", forKey: "Name")
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                
                //in case something went wrong, as errstring to get the error
            } else {
                // everthing went okay
                self._user = User(firstName,lastName,emailAddress,password)
            }
        }
    }
    public func signInAsUser(_ emailAddress:String, _ password:String){
        let user = PFUser()
        user.username = emailAddress
        user.password = password
    }
    
}

class Rider{
    private var _name:String
    private var _location:String
    private var _destination:String
    
    public var name:String {get{return _name}}
    public var location:String {get{return _location}}
    public var destination:String {get{return _destination}}
    
    init(name:String, location:String, destination:String){
        _name = name
        _location = location
        _destination = destination
    }
}
/**
 This class is the basic user class. It holds the generic info about a user.
 This includes their name, when they joined, and what timeZone they are in currently.
 */
class User {
    private var _firstName:String
    private var _lastName:String
    private var _emailAddress:String
    private var _password:String
    
    public var firstName:String { get { return _firstName}}
    public var lastName:String { get { return _lastName}}
    public var emailAddress:String {get {return _emailAddress}}
    public var password:String{get{return _password}}
    init(){
        _firstName = ""
        _lastName = ""
        _emailAddress = ""
        _password = ""
    }
    init(_  first:String, _ last:String, _ emailAdress:String, _ password:String){
        _firstName = first
        _lastName = last
        _emailAddress = emailAdress
        _password = password
    }
    
}

//may merge this with just user
//class Driver:User {
//    private var _canDrive:Bool
//    private var _seatsAvailable:Int
//    private var _currentStatus:currentStatus
//    private var _currentLocation:CLLocation
//}

/**
 Enumeration meanings
 waiting: waiting for a fare
 routing: en transit to destination
 gatheringInformation: getting information from fare for delivery
 abstaining: driver isn't currently accepting fares
 */
enum currentStatus {
    case waiting, routing, gatheringInformation, abstaining
}
