//
//	GithubRoot.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
//import ObjectMapper
//
import ObjectMapper

class GithubRoot : NSObject, NSCoding, Mappable{

	var authorizationsUrl : String?
	var codeSearchUrl : String?
	var commitSearchUrl : String?
	var currentUserAuthorizationsHtmlUrl : String?
	var currentUserRepositoriesUrl : String?
	var currentUserUrl : String?
	var emailsUrl : String?
	var emojisUrl : String?
	var eventsUrl : String?
	var feedsUrl : String?
	var followersUrl : String?
	var followingUrl : String?
	var gistsUrl : String?
	var hubUrl : String?
	var issueSearchUrl : String?
	var issuesUrl : String?
	var keysUrl : String?
	var notificationsUrl : String?
	var organizationRepositoriesUrl : String?
	var organizationUrl : String?
	var publicGistsUrl : String?
	var rateLimitUrl : String?
	var repositorySearchUrl : String?
	var repositoryUrl : String?
	var starredGistsUrl : String?
	var starredUrl : String?
	var teamUrl : String?
	var userOrganizationsUrl : String?
	var userRepositoriesUrl : String?
	var userSearchUrl : String?
	var userUrl : String?


	class func newInstance(map: Map) -> Mappable?{
		return GithubRoot()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		authorizationsUrl <- map["authorizations_url"]
		codeSearchUrl <- map["code_search_url"]
		commitSearchUrl <- map["commit_search_url"]
		currentUserAuthorizationsHtmlUrl <- map["current_user_authorizations_html_url"]
		currentUserRepositoriesUrl <- map["current_user_repositories_url"]
		currentUserUrl <- map["current_user_url"]
		emailsUrl <- map["emails_url"]
		emojisUrl <- map["emojis_url"]
		eventsUrl <- map["events_url"]
		feedsUrl <- map["feeds_url"]
		followersUrl <- map["followers_url"]
		followingUrl <- map["following_url"]
		gistsUrl <- map["gists_url"]
		hubUrl <- map["hub_url"]
		issueSearchUrl <- map["issue_search_url"]
		issuesUrl <- map["issues_url"]
		keysUrl <- map["keys_url"]
		notificationsUrl <- map["notifications_url"]
		organizationRepositoriesUrl <- map["organization_repositories_url"]
		organizationUrl <- map["organization_url"]
		publicGistsUrl <- map["public_gists_url"]
		rateLimitUrl <- map["rate_limit_url"]
		repositorySearchUrl <- map["repository_search_url"]
		repositoryUrl <- map["repository_url"]
		starredGistsUrl <- map["starred_gists_url"]
		starredUrl <- map["starred_url"]
		teamUrl <- map["team_url"]
		userOrganizationsUrl <- map["user_organizations_url"]
		userRepositoriesUrl <- map["user_repositories_url"]
		userSearchUrl <- map["user_search_url"]
		userUrl <- map["user_url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         authorizationsUrl = aDecoder.decodeObject(forKey: "authorizations_url") as? String
         codeSearchUrl = aDecoder.decodeObject(forKey: "code_search_url") as? String
         commitSearchUrl = aDecoder.decodeObject(forKey: "commit_search_url") as? String
         currentUserAuthorizationsHtmlUrl = aDecoder.decodeObject(forKey: "current_user_authorizations_html_url") as? String
         currentUserRepositoriesUrl = aDecoder.decodeObject(forKey: "current_user_repositories_url") as? String
         currentUserUrl = aDecoder.decodeObject(forKey: "current_user_url") as? String
         emailsUrl = aDecoder.decodeObject(forKey: "emails_url") as? String
         emojisUrl = aDecoder.decodeObject(forKey: "emojis_url") as? String
         eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
         feedsUrl = aDecoder.decodeObject(forKey: "feeds_url") as? String
         followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
         followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
         gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
         hubUrl = aDecoder.decodeObject(forKey: "hub_url") as? String
         issueSearchUrl = aDecoder.decodeObject(forKey: "issue_search_url") as? String
         issuesUrl = aDecoder.decodeObject(forKey: "issues_url") as? String
         keysUrl = aDecoder.decodeObject(forKey: "keys_url") as? String
         notificationsUrl = aDecoder.decodeObject(forKey: "notifications_url") as? String
         organizationRepositoriesUrl = aDecoder.decodeObject(forKey: "organization_repositories_url") as? String
         organizationUrl = aDecoder.decodeObject(forKey: "organization_url") as? String
         publicGistsUrl = aDecoder.decodeObject(forKey: "public_gists_url") as? String
         rateLimitUrl = aDecoder.decodeObject(forKey: "rate_limit_url") as? String
         repositorySearchUrl = aDecoder.decodeObject(forKey: "repository_search_url") as? String
         repositoryUrl = aDecoder.decodeObject(forKey: "repository_url") as? String
         starredGistsUrl = aDecoder.decodeObject(forKey: "starred_gists_url") as? String
         starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
         teamUrl = aDecoder.decodeObject(forKey: "team_url") as? String
         userOrganizationsUrl = aDecoder.decodeObject(forKey: "user_organizations_url") as? String
         userRepositoriesUrl = aDecoder.decodeObject(forKey: "user_repositories_url") as? String
         userSearchUrl = aDecoder.decodeObject(forKey: "user_search_url") as? String
         userUrl = aDecoder.decodeObject(forKey: "user_url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if authorizationsUrl != nil{
			aCoder.encode(authorizationsUrl, forKey: "authorizations_url")
		}
		if codeSearchUrl != nil{
			aCoder.encode(codeSearchUrl, forKey: "code_search_url")
		}
		if commitSearchUrl != nil{
			aCoder.encode(commitSearchUrl, forKey: "commit_search_url")
		}
		if currentUserAuthorizationsHtmlUrl != nil{
			aCoder.encode(currentUserAuthorizationsHtmlUrl, forKey: "current_user_authorizations_html_url")
		}
		if currentUserRepositoriesUrl != nil{
			aCoder.encode(currentUserRepositoriesUrl, forKey: "current_user_repositories_url")
		}
		if currentUserUrl != nil{
			aCoder.encode(currentUserUrl, forKey: "current_user_url")
		}
		if emailsUrl != nil{
			aCoder.encode(emailsUrl, forKey: "emails_url")
		}
		if emojisUrl != nil{
			aCoder.encode(emojisUrl, forKey: "emojis_url")
		}
		if eventsUrl != nil{
			aCoder.encode(eventsUrl, forKey: "events_url")
		}
		if feedsUrl != nil{
			aCoder.encode(feedsUrl, forKey: "feeds_url")
		}
		if followersUrl != nil{
			aCoder.encode(followersUrl, forKey: "followers_url")
		}
		if followingUrl != nil{
			aCoder.encode(followingUrl, forKey: "following_url")
		}
		if gistsUrl != nil{
			aCoder.encode(gistsUrl, forKey: "gists_url")
		}
		if hubUrl != nil{
			aCoder.encode(hubUrl, forKey: "hub_url")
		}
		if issueSearchUrl != nil{
			aCoder.encode(issueSearchUrl, forKey: "issue_search_url")
		}
		if issuesUrl != nil{
			aCoder.encode(issuesUrl, forKey: "issues_url")
		}
		if keysUrl != nil{
			aCoder.encode(keysUrl, forKey: "keys_url")
		}
		if notificationsUrl != nil{
			aCoder.encode(notificationsUrl, forKey: "notifications_url")
		}
		if organizationRepositoriesUrl != nil{
			aCoder.encode(organizationRepositoriesUrl, forKey: "organization_repositories_url")
		}
		if organizationUrl != nil{
			aCoder.encode(organizationUrl, forKey: "organization_url")
		}
		if publicGistsUrl != nil{
			aCoder.encode(publicGistsUrl, forKey: "public_gists_url")
		}
		if rateLimitUrl != nil{
			aCoder.encode(rateLimitUrl, forKey: "rate_limit_url")
		}
		if repositorySearchUrl != nil{
			aCoder.encode(repositorySearchUrl, forKey: "repository_search_url")
		}
		if repositoryUrl != nil{
			aCoder.encode(repositoryUrl, forKey: "repository_url")
		}
		if starredGistsUrl != nil{
			aCoder.encode(starredGistsUrl, forKey: "starred_gists_url")
		}
		if starredUrl != nil{
			aCoder.encode(starredUrl, forKey: "starred_url")
		}
		if teamUrl != nil{
			aCoder.encode(teamUrl, forKey: "team_url")
		}
		if userOrganizationsUrl != nil{
			aCoder.encode(userOrganizationsUrl, forKey: "user_organizations_url")
		}
		if userRepositoriesUrl != nil{
			aCoder.encode(userRepositoriesUrl, forKey: "user_repositories_url")
		}
		if userSearchUrl != nil{
			aCoder.encode(userSearchUrl, forKey: "user_search_url")
		}
		if userUrl != nil{
			aCoder.encode(userUrl, forKey: "user_url")
		}

	}

}
