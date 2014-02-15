## WORK
#
Template.Work.events
	'click #workDetailsButton': () ->
		toggleSessionVar 'showWorkDetails'

	'click #uploadWorkButton' : () ->
		console.log "loading new work"
		id = this._id
		# largest = _.max _.pluck(Work.find({project:id}).fetch(), 'sortOrder')
		filepicker.pick (InkBlob)->
			# console.log InkBlob
			work = 
				project : id
				link : InkBlob.url
				title : InkBlob.filename
				sortOrder : 0
				mimetype : InkBlob.mimetype 			
			# console.log work
			Work.insert work

	'click #acceptEmbedButton' : (e, t) ->
		id = Session.get "embedInProject"
		url = t.find("input#embedLink").value
		work = 
			project : id
			link : url
			sortOrder : 0
			mimetype : "url/embed"
		Work.insert work
		Session.set "embedInProject" , false 

	'click #embedButton' : (e, t) ->
		#console.log "attempting to embed in: " + this._id
		Session.set "embedInProject" , this._id

Template.Work.helpers
	works : () ->
		projectId = this._id
		Work.find project : projectId , {sort: [['sortOrder', 'asc']]}


	showDetails : () -> Session.get 'showWorkDetails'	


	

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
		if t.data.mimetype is "url/embed"
			removeEmbed e, t
		else
			removeImage e, t		

		

	'click .sort-up': (e, t) ->
		id = t.data._id
		console.log 'clicked sort-up for ' + id
		Work.update id, '$inc' : 'sortOrder' : -1 

	'click .sort-down' : (e, t) ->
		id = t.data._id
		console.log 'clicked sort-down for ' + id
		Work.update id, '$inc' : 'sortOrder' : 1 

removeEmbed = (e, t) ->
	Work.remove {_id: t.data._id}

removeImage = (e, t) ->
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


editInfoOff = () -> Session.set 'editInfoFor', 'NONE SELECTED'		

Template.WorkItem.helpers
	showDetails : () -> Session.get 'showWorkDetails'	

	editWorkInfo : () ->  
		Session.equals 'editInfoFor', this._id 

	isEmbed : () -> 
		mimetype = this.mimetype
		if mimetype
			mimetype.split('/')[1] is "embed"
