
Template.Project.events
	'click .remove-project' : (e, t) ->
		project = t.data._id
		Projects.update project, {$set: {published: false}}

	'click .sort-up' : (e, t) ->
		id = t.data._id
		console.log 'clicked sort-up for ' + id
		Projects.update id, '$inc' : 'sortOrder' : -1 

	'click .sort-down' : (e, t) ->
		id = t.data._id
		console.log 'clicked sort-down for ' + id
		Projects.update id, '$inc' : 'sortOrder' : 1 