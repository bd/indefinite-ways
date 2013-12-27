

Meteor.publish "projects" , () -> 
	# return Projects.find()
	return Projects.find({published:true})

Meteor.publish "work" , () ->
	return Work.find()


