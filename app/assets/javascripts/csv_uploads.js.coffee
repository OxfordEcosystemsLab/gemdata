class @CSVUploads


    constructor: ->
        @scope = $("#csv_upload_progress")
        if @scope
            @jumpToBottomOfTextarea()


    jumpToBottomOfTextarea: ->

        @scope.on 'click', 'a[data-hook="jump_bottom"]', (event) ->
            textbox = $('textarea[data-field="upload_results"]')
            textbox.scrollTop(
                textbox[0].scrollHeight - textbox.height()
            )
            event.preventDefault()
