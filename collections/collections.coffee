# COLLECTIONS
@Projects = new Meteor.Collection "projects"
       # <Project> ::=
       #          title : <String>
       #          description : <String>
       #          published : <boolean>
       #          tags : [<String>]
       #          resources : [<Resource>]

@Work = new Meteor.Collection "work"
       # <Work> ::=
       #          project : <ProjectId>
       #          link : <URL>
       #          title : <String>?
       #          date : <String | Date>?
       #          media : <String>?
       #          dimensions : <String>?


