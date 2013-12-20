## DESCRIPTION
#
Template.Description.events
	'click #editTitleButton': (e, t) ->
		console.log 'clicked editTitle'
		toggleSessionVar 'editTitle'

	'click #cancelEditTitleButton' : (e, t) ->
		toggleSessionVar 'editTitle'

	'click #acceptEditTitleButton' : (e, t) ->
		titleText = t.find('input#titleTextInput').value
		projectId = this._id 
		Projects.update projectId , {$set: {title: titleText}}
		toggleSessionVar 'editTitle'

	'click #editDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #cancelEditDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #acceptEditDescriptionButton' : (e, t) ->
		descText = t.find('textarea#descriptionTextInput').value
		projectId = this._id
		Projects.update projectId , {$set: {description: descText}}
		toggleSessionVar 'editDescription'

Template.Description.helpers

	editTitle: () -> Session.get 'editTitle'

	editDescription: () -> Session.get 'editDescription'
