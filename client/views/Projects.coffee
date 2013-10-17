# Projects.coffee

Template.Projects.helpers
	projects: () ->
		Projects.find()