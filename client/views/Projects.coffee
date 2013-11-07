# Projects.coffee

Template.Projects.created = () ->
	Meteor.call 'filePickerKey', (e, r) -> loadPicker r

Template.Projects.helpers
	projects: () ->
		Projects.find()

Template.Projects.events
	'click #newProjectButton': () ->
		Projects.insert(
			title : 'New Project'
			description : 'Description'
			published : false
			sortOrder : 0 , 
			(error, id) -> 
				if error
					Session.set 'alerts', error
				else
					Session.set 'theProjectId', id)