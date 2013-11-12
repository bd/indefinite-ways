Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun
	#the user is submitted already in every method call
	Meteor.call('isAuthorized', Meteor.user(), (error, result) -> Session.set 'isAuthorized', result)

Handlebars.registerHelper 'allowEdits', () -> Session.get "isAuthorized"

Handlebars.registerHelper 'alerts', () -> Session.get 'alerts'

Template.Project.events
	'click': () ->
		# ...


