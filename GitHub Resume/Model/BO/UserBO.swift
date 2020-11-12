//
//  UserBO.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

class UserBO: BaseBO {
    
    var login: String!
    var avatarURL: String!
    var htmlURL : String!
    var followersURL: String!
    var followingURL : String!
    var gistsURL : String!
    var starredURL: String!
    var subscriptionsURL : String!
    var organizationsURL : String!
    var reposURL: String!
    var eventsURL: String!
    var receivedEventsURL: String!
    var type: String!
    var company: String!
    var blog: String!
    var location: String!
    var email : String!
    var publicRepos  : Int64!
    var publicGists : Int64!
    var followers : Int64!
    var following: Int64!
    var bio: String?
   
    
    
    
    private enum CodingKeys : String ,CodingKey {
        case login = "login"
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case company = "compant"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case bio = "bio"
        
        
        
    }
    
   
    
    
    required public init(from decoder: Decoder) throws{
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let elementValue = try? values.decode(String.self, forKey: .login) {
            login = elementValue
        }
        
        
        if let elementValue = try? values.decode(String.self, forKey: .avatarURL) {
            avatarURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .htmlURL) {
            htmlURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .followersURL) {
            followersURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .followingURL) {
            followingURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .gistsURL) {
            gistsURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .starredURL) {
            starredURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .subscriptionsURL) {
            subscriptionsURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .organizationsURL) {
            organizationsURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .reposURL) {
            reposURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .eventsURL) {
            eventsURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .receivedEventsURL) {
            receivedEventsURL = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .type) {
            type = elementValue
        }
        
        
        if let elementValue = try? values.decode(String.self, forKey: .company) {
            company = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .blog) {
            blog = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .location) {
            location = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .email) {
            email = elementValue
        }
        
        if let elementValue = try? values.decode(Int64.self, forKey: .publicRepos) {
            publicRepos = elementValue
        }
        
        if let elementValue = try? values.decode(Int64.self, forKey: .publicGists) {
            publicGists = elementValue
        }
        
        if let elementValue = try? values.decode(Int64.self, forKey: .followers) {
            followers = elementValue
        }
        
        
        
        if let elementValue = try? values.decode(Int64.self, forKey: .following) {
            following = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .bio) {
            bio = elementValue
        }
        
        
    }
    
}

