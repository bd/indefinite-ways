Deps.autorun () ->
	#note that for this implementation, the argument Meteor.user()
	#is included only to provide a reactive data source for Deps.autorun
	#the user is submitted already in every method call
	Meteor.call('isAuthorized', Meteor.user(), (error, result) -> Session.set 'isAuthorized', result)

Handlebars.registerHelper 'allowEdits', () -> Session.get "isAuthorized"

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
		projectId = Session.get 'theProjectId'
		Projects.update projectId , {$set: {title: titleText}}
		toggleSessionVar 'editTitle'

	'click #editDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #cancelEditDescriptionButton' : (e, t) ->
		toggleSessionVar 'editDescription'

	'click #acceptEditDescriptionButton' : (e, t) ->
		descText = document.getElementById('descriptionTextInput').value
		projectId = Session.get 'theProjectId'
		Projects.update projectId , {$set: {description: descText}}
		toggleSessionVar 'editDescription'

Template.Description.helpers

	theProject : () -> if Session.get 'theProjectId' then Projects.findOne({'_id':Session.get 'theProjectId'}) else Projects.findOne()

	editTitle: () -> Session.get 'editTitle'

	editDescription: () -> Session.get 'editDescription'


## WORK
#
Template.Work.events
	'click #workDetailsButton': () ->
		toggleSessionVar 'showWorkDetails'

Template.Work.helpers
	works : () ->
		projectId = Session.get 'theProjectId'
		Work.find project : projectId

	showDetails : () -> Session.get 'showWorkDetails'	


	

## WORKITEM
#
Template.WorkItem.events
	'click .remove-work': (e, t) ->
		# console.log 'removing: ' + t.data._id
		Work.remove( _id : t.data._id)

	'click #editInfoButton': (e, t) ->
		Session.set 'editInfoFor' , t.data._id

	'click #acceptInfoEdit' : (e, t) ->
		e.preventDefault()
		id = t.data._id
		# console.log  t.find 'input#workTitleText'
		updates = 
			title : t.find('input#workTitleText').value
			date : t.find('input#workDateText').value
			media : t.find('input#workMediaText').value
			dimensions : t.find('input#workDimensionsText').value
		Work.update id, {$set:updates}
		editInfoOff()


	'click #cancelInfoEdit' : (e, t) ->
		e.preventDefault()
		editInfoOff()

editInfoOff = () -> Session.set 'editInfoFor', 'NONE SELECTED'		

Template.WorkItem.helpers
	showDetails : () -> Session.get 'showWorkDetails'	

	editWorkInfo : () ->  
		Session.equals 'editInfoFor', this._id 
