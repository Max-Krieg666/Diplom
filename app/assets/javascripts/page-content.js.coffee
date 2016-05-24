jQuery ->
  markdownSettings = {
    previewParserPath: '/markdown/preview'
    onShiftEnter:	{keepDefault:false, openWith:'\n\n'}
    markupSet: [
      {
        name:'First Level Heading', key:'1',
        placeHolder:'Your title here...',
        closeWith: (markItUp) -> markdownTitle(markItUp, '=')
      },
      {
        name:'Second Level Heading', key:'2', placeHolder:'Your title here...',
        closeWith: (markItUp) -> markdownTitle(markItUp, '-')
      },
      {name:'Heading 3', key:'3', openWith:'### ', placeHolder:'Your title here...' }
      {name:'Heading 4', key:'4', openWith:'#### ', placeHolder:'Your title here...' }
      {name:'Heading 5', key:'5', openWith:'##### ', placeHolder:'Your title here...' }
      {name:'Heading 6', key:'6', openWith:'###### ', placeHolder:'Your title here...' }
      {separator:'---------------' }
      {name:'Bold', key:'B', openWith:'**', closeWith:'**'}
      {name:'Italic', key:'I', openWith:'_', closeWith:'_'}
      {separator:'---------------' }
      {name:'Bulleted List', openWith:'- ' }
      {name:'Numeric List', openWith: (markItUp) -> markItUp.line+'. ' }
      {separator:'---------------' }
      {
        name:'Picture', key:'P',
        replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")'
      },
      {
        name:'Link', key:'L', openWith:'[',
        closeWith:']([![Url:!:http://]!] "[![Title]!]")',
        placeHolder:'Your text to link here...'
      },
      {separator:'---------------'}
      {name:'Quotes', openWith:'> '}
      {name:'Code Block / Code', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'}
      {separator:'---------------'}
      {name:'Preview', call:'preview', className:"preview"}
    ]
  }

  markdownTitle = (markItUp, char) ->
    heading = '';
    n = $.trim(markItUp.selection||markItUp.placeHolder).length;
    for i in [0..n]
      heading += char
    '\n'+heading

  $('#page_content').markItUp(markdownSettings)
  $('#section_content').markItUp(markdownSettings)

  $ ->
    $(document).on 'click', '#js-show-form-btn', ->
      if window.location.pathname == '/pages'
        $.get
          url: '/pages/new'
          method: 'GET'
          dataType: 'html'
          success: (data) ->
            $('#show-form').html($(data).find('#new_page_for_discipline'))
            $('#page_content').markItUp(markdownSettings)

  $ ->
    $(document).on 'click', '#js-new-section-btn', ->
      if window.location.pathname.includes('/pages/')
        page_id = window.location.pathname.substr(7)
        $.get
          url: '/sections/new?page_id=' + page_id
          method: 'GET'
          dataType: 'html'
          success: (data) ->
            $('#show-section-form').html($(data).find('#new_section_for_page'))
            $('#section_content').markItUp(markdownSettings)