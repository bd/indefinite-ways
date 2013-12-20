# Projects.coffee

Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun, 
	#since the user is submitted already in every method call
	Meteor.call('isAuthorized', 
		Meteor.user(), 
		(error, result) -> 
			Session.set 'isAuthorized', result)

Handlebars.registerHelper 'allowEdits', () -> Session.get "isAuthorized"

Handlebars.registerHelper 'alerts', () -> Session.get 'alerts'

Template.Projects.created = () ->
	Meteor.call 'filePickerKey', (e, r) -> 
		console.log 'loading filePickerKey: ' + r
		loadPicker r
	
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