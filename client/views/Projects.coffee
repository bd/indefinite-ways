# Projects.coffee

Template.Projects.helpers
	projects: () ->
		Project.find({published : true})