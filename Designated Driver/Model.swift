//
//  Model.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 3/14/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import Foundation
import CoreLocation
/**
 Current use of the UserModel Class should be for User Authentication,
 User Interactions with the app, and provide an interface for connecting
 to a database.
 */
class UserModel {
    static let instance = UserModel()
    private var _userLocation = CLLocation()
    public var userLocation:CLLocation {get{return _userLocation}}
    private init() {}
    
    public func setUserLocation(_ location:CLLocation){
        _userLocation = location
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
    
    init(_  first:String, last:String, emailAdress:String, password:String){
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
