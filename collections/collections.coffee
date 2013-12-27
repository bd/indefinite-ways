# COLLECTIONS
@Projects = new Meteor.Collection "projects"
       # <Project> ::=
       #          title : <String>
       #          description : <String>
       #          published : <boolean>
       #          tags : [<String>]?
       #          sortOrder : <number>?

@Work = new Meteor.Collection "work"
       # <Work> ::=
       #          project : <ProjectId>
       #          link : <URL>
       #          title : <String>?
       #          date : <String | Date>?
       #          media : <String>?
       #          dimensions : <String>?
       #          sortOrder : <number>?


Projects.allow {
       insert: (userId, project) -> Meteor.call 'isAuthorized'
       update: (userId, project) -> Meteor.call 'isAuthorized'
       remove: (userId, project) -> Meteor.call 'isAuthorized'
       }

Work.allow {
       insert: (userId, work) -> Meteor.call 'isAuthorized'
       update: (userId, work) -> Meteor.call 'isAuthorized'
       remove: (userId, work) -> Meteor.call 'isAuthorized'
       }