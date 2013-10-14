Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun
	#the user is submitted already in every method call
	Meteor.call('isAuthorized', Meteor.user(), (error, result) -> Session.set 'isAuthorized', result)


isAuthorized = () -> Session.get "isAuthorized"

Template.Project.events
	'click': () ->
		# ...

Template.Project.helpers
	allowEdits: isAuthorized
		


## DESCRIPTION
#
Template.Description.events
	'click': () ->
		# ...

Template.Description.helpers
	allowEdits: isAuthorized


## WORK
#
Template.Work.events
	'click': () ->
		# ...

Template.Work.helpers
	isAuthorized: isAuthorized