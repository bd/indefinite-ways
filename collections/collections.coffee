# COLLECTIONS
@Projects = new Meteor.Collection "projects"
       # <Project> ::=
       #          url : <String> //unique!
       #          title : <String>
       #          description : <String>
       #          status : 'published' || 'unpublished'
       #          tags : [<String>]
       #          resources : [<Resource>]

@Resources = new Meteor.Collection "resources"
       # <Resource> ::=
       #          project : <ProjectId>
       #          link : <URL>
       #          title : <String>?
       #          date : <String | Date>?
       #          media : <String>?
       #          size : <String>?



isUnique = (field, value) ->
        selector = {}
        selector[field] = value
        this.find(selector).count() < 2

exists = (field, value) ->
        selector = {}
        selector[field] = value
        this.find(selector).count() > 0

isConflictingUrl = (projectId, url) ->
        doc = this.findOne({_id : projectId})
        if doc? and doc.url == url and this.isUnique('url', url)
                false
        doc? and doc.url != url and this.exists('url', url)
        
        
Projects.isUnique = isUnique
Projects.exists = exists
Projects.isConflictingUrl = isConflictingUrl

Resources.isUnique = isUnique        
Resources.exists = exists