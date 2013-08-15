# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$.api.authenticatedProjects =
    init: ->
        $.api.tasks.init()


        elements =
            projectsContainer:   $('div#projects')

            newProjectToggler:   $('a#new-project-toggler')
            newProjectContainer: $('div#new-project')
            newProjectForm:      $('form#new-project')

        liveElements =
            destroyProject: 'a.destroy-project'
            editProject: 'a.edit-project-name'


        callbacks =
            toggleNewProjectContainer: (event) ->
                event.preventDefault()
                elements.newProjectContainer.slideToggle('fast')

            createProject: (event, xhr, status) ->
                response = $.parseJSON(xhr.responseText)

                if ( status == 'success' )
                    elements.projectsContainer.prepend(response.entry)
                    elements.newProjectContainer.slideToggle 'fast'

                    $(this).trigger('reset')
                    $.api.utils.setAsSortable('ul.todo-list', 'draggable-task-placeholder', '.task-drag-handle')
                else
                    $.api.utils.assignErrorsFor('project', response.errors, $(this))

            resetProjectForm: ->
                $this = $(this)

                $this.find('.error').removeClass('error')
                $this.find('.help-block, .help-inline').remove()

        liveCallbacks =
            destroyProject: ->
                $(this).parents('div.project').remove()
            editProject: (event) ->
                event.stopPropagation()
                event.preventDefault()

                projectId = @id.replace('edit-project-name-', '')
                $("span#project-#{projectId}").editable('toggle')


        # Bindings
        elements.newProjectToggler.bind 'click', callbacks.toggleNewProjectContainer
        elements.newProjectForm.
            bind('ajax:complete',   callbacks.createProject).
            bind('ajax:beforeSend', callbacks.resetProjectForm)

        # Validations
        elements.newProjectForm.
            find('input#project_name').bind 'keyup', $.api.utils.toggleSubmit

        # Live bindings

        # Destroy
        elements.projectsContainer.on 'ajax:beforeSend', liveElements.destroyProject, -> $(this).addClass('disabled')
        elements.projectsContainer.on 'ajax:complete', liveElements.destroyProject, liveCallbacks.destroyProject

        # Edit
        elements.projectsContainer.on 'click', liveElements.editProject, liveCallbacks.editProject

