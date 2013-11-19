

<<<<<<< HEAD
=======
Handlebars.registerHelper 'alerts', () -> Session.get 'alerts'

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

	'click #uploadWorkButton' : () ->
		id = Session.get 'theProjectId'
		largest = _.max _.pluck(Work.find({project:id}).fetch(), 'sortOrder')
		filepicker.pick (InkBlob)->
			work = 
				project : id
				link : InkBlob.url
				title : InkBlob.filename
				sortOrder : largest + 1			
			console.log work
			Work.insert work

Template.Work.helpers
	works : () ->
		projectId = this._id
		Work.find project : projectId , {sort: [['sortOrder', 'asc']]}


	showDetails : () -> Session.get 'showWorkDetails'	

Template.Work.created = () ->
	Meteor.call 'filePickerKey', (e, r) -> loadPicker r




	

## WORKITEM
#
Template.WorkItem.events

	'click #editInfoButton': (e, t) ->
		Session.set 'editInfoFor' , t.data._id

	'click #acceptInfoEdit' : (e, t) ->
		e.preventDefault()
		id = t.data._id
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

	'click .remove-work': (e, t) ->
		
		#First, delete from FP, 
		blob = url : t.data.link
		filepicker.remove blob,
		#security options (currently not enabled FP security)
		 {},
		 #callback to remove from DB
		 () ->
		 	Work.remove {_id: t.data._id},
		 #callback on error
		 (FPError) -> 
		 	Session.set 'alerts', FPError

	'click .sort-up': (e, t) ->
		id = t.data._id
		console.log 'clicked sort-up for ' + id
		Work.update id, '$inc' : 'sortOrder' : -1 

	'click .sort-down' : (e, t) ->
		id = t.data._id
		console.log 'clicked sort-down for ' + id
		Work.update id, '$inc' : 'sortOrder' : 1 



editInfoOff = () -> Session.set 'editInfoFor', 'NONE SELECTED'		

Template.WorkItem.helpers
	showDetails : () -> Session.get 'showWorkDetails'	

	editWorkInfo : () ->  
		Session.equals 'editInfoFor', this._id 
>>>>>>> parent of 819f577... fixed my stack bash problem
