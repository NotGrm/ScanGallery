$ ->
  window.ChangePage = (page, loc) ->
    window.location.href=page

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
  $("#html5_uploader").pluploadQueue
    
    # General settings
    runtimes: "html5"
    url: "/mangas/" + gon.manga_id + "/chapters/" + gon.chapter_id + "/pages"
    multipart: true
    multipart_params:
      authenticity_token: "<%= form_authenticity_token %>"
    max_file_size: "10mb"
    chunk_size: "1mb"
    unique_names: true

  uploader = $("#html5_uploader").pluploadQueue()

  uploader.bind "UploadComplete", (up, files) ->
    $("#readButton").show()

  uploader.init()


