$ ->
  window.initReader = ->
    width = $(".controls").width()
    $(".controls").attr "style", "margin-left:-" + (width / 2) + "px"
  window.ChangePage = (page, loc) ->
    window.location.href=page

  $(document).scroll ->
    elem = $(".reader-nav")
    unless elem.attr("data-top")
      return  if elem.hasClass("navbar-fixed-top")
      offset = elem.offset()
      elem.attr "data-top", offset.top
    if elem.attr("data-top") - elem.outerHeight() <= $(this).scrollTop() - $(elem).outerHeight()
      elem.addClass "navbar-fixed-top"
    else
      elem.removeClass "navbar-fixed-top"

  @ChangeChapter = ->
    chapter = $("#cmbchapters :selected").val() 
    url = "../../" + chapter + "/pages/1"
    window.location.href=url

  $(document).keydown (e) =>
    switch e.keyCode
      when 37 then ChangePage $("#cmbpages :selected").prev().val(), 1
      when 39 then ChangePage $("#cmbpages :selected").next().val(), 1

  if $("#readButton").length > 0
    $("#readButton").hide()

  # Setup html5 version
  uploader = $("#html5_uploader").pluploadQueue
    
    # General settings
    runtimes: "html5"
    url: "/mangas/" + gon.manga_id + "/chapters/" + gon.chapter_id + "/pages"
    multipart: true
    multipart_params:
      authenticity_token: "<%= form_authenticity_token %>"
    max_file_size: "10mb"
    chunk_size: "1mb"
    unique_names: true

   # $("#html5_uploader").pluploadQueue()

  uploader.bind "UploadComplete", (up, files) ->
    $("#readButton").show()

  uploader.init()


