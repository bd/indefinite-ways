

Meteor.publish "projects" , () -> 
	return Projects.find()

Meteor.publish "work" , () ->
	return Work.find()