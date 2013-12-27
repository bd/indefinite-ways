
Template.Project.events
	'click .remove-project': (e, t) ->
		# console.log t.da
		project = t.data._id
		console.log project
		Projects.update project, {$set: {published: false}}
