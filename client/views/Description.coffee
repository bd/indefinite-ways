## DESCRIPTION
#
Template.Description.events
	'click #editTitleButton': (e, t) ->
		Session.set 'editTitle', this._id

	'click #cancelEditTitleButton' : (e, t) ->
		Session.set 'editTitle', false

	'click #acceptEditTitleButton' : (e, t) ->
		titleText = t.find('input#titleTextInput').value
		projectId = this._id 
		Projects.update projectId , {$set: {title: titleText}}
		Session.set 'editTitle', false

	'click #editDescriptionButton' : (e, t) ->
		Session.set 'editDescription', this._id

	'click #cancelEditDescriptionButton' : (e, t) ->
		Session.set 'editDescription', false

	'click #acceptEditDescriptionButton' : (e, t) ->
		descText = t.find('textarea#descriptionTextInput').value
		projectId = this._id
		Projects.update projectId , {$set: {description: descText}}
		Session.set 'editDescription', false

Template.Description.helpers

	editTitle: () -> 
		edit = Session.get 'editTitle'
		edit == this._id 


	editDescription: () -> 
		edit = Session.get 'editDescription'
		edit == this._id 