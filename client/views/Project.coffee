Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun
	#the user is submitted already in every method call
	Meteor.call('isAuthorized', Meteor.user(), (error, result) -> Session.set 'isAuthorized', result)


isAuthorized = () -> Session.get "isAuthorized"

Template.Project.events
	'click': () ->
		# ...


		


## DESCRIPTION
#
Template.Description.events
	'click #editTitleButton': (e, t) ->
		toggleSessionVar 'editTitle'

	'click #cancelEditTitleButton' : (e, t) ->
		toggleSessionVar 'editTitle'

	'click #acceptEditTitleButton' : (e, t) ->
		titleText = document.getElementById('titleTextInput').value
		project = Session.get 'theProject'
		project.title = titleText
		Projects.update project._id , project
		toggleSessionVar 'editTitle'

	'click #editDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #cancelEditDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #acceptEditDescriptionButton' : (e, t) ->
		descText = document.getElementById('descriptionTextInput').value
		project = Session.get 'theProject'
		project.description = descText
		Projects.update project._id , project
		toggleSessionVar 'editDescription'

Template.Description.helpers
	allowEdits: isAuthorized


	theProject : () -> if Session.get 'theProjectId' then Projects.findOne({'_id':Session.get 'theProjectId'}) else Projects.findOne()

	editTitle: () -> Session.get 'editTitle'

	editDescription: () -> Session.get 'editDescription'


## WORK
#
Template.Work.events
	'click': () ->
		# ...

Template.Work.helpers
	isAuthorized: isAuthorized
	