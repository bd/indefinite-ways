Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun
	#the user is submitted already in every method call
	Meteor.call('isAuthorized', Meteor.user(), (error, result) -> Session.set 'isAuthorized', result)


isAuthorized = () -> Session.get "isAuthorized"

toggleSessionVar = (name) -> Session.set name , not Session.get name

Template.Project.events
	'click': () ->
		# ...


		


## DESCRIPTION
#
Template.Description.events
	'click #editTitleButton': () ->
		toggleSessionVar 'editTitle'

Template.Description.helpers
	allowEdits: isAuthorized

	editTitle: () ->
		Session.get "editTitle"


## WORK
#
Template.Work.events
	'click': () ->
		# ...

Template.Work.helpers
	isAuthorized: isAuthorized
	