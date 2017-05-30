($(document).on 'turbolinks:load', ->
  ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] =
    add: (element, settings, message) ->
      @wrapper(settings.wrapper).add.call this, element, settings, message
    remove: (element, settings) ->
      @wrapper(settings.wrapper).remove.call this, element, settings
    wrapper: (name) ->
      @wrappers[name] or @wrappers['default']
    wrappers: 'default':
      add: (element, settings, message) ->
        errorElement = undefined
        wrapper = undefined
        wrapper = element.closest(settings.wrapper_tag + '.' + settings.wrapper_class.replace(/\ /g, '.'))
        errorElement = wrapper.find(settings.error_tag + '.' + settings.error_class.replace(/\ /g, '.'))
        if !errorElement.length
          errorElement = $('<' + settings.error_tag + '/>',
            'class': settings.error_class
            text: message)
          wrapper.append errorElement
        wrapper.addClass settings.wrapper_error_class
        errorElement.text message
      remove: (element, settings) ->
        errorElement = undefined
        wrapper = undefined
        wrapper = element.closest(settings.wrapper_tag + '.' + settings.wrapper_class.replace(/\ /g, '.') + '.' + settings.wrapper_error_class)
        errorElement = wrapper.find(settings.error_tag + '.' + settings.error_class.replace(/\ /g, '.'))
        wrapper.removeClass settings.wrapper_error_class
        errorElement.remove()
  return
).call this