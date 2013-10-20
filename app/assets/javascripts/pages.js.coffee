$ ->
  window.initReader = ->
    width = $(".controls").width()
    $(".controls").attr "style", "margin-left:-" + (width / 2) + "px"

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

    $(document).keydown (e) =>
      switch e.keyCode
        when 37 then url = $(".previous a").attr("href")
        when 39 then url = $(".next a").attr("href")
        else return

      window.location.href = url

  window.initUploader = ->
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

  if $("#readButton").length > 0
    $("#readButton").hide()


