$ ->
  uploader = new plupload.Uploader(
    runtimes: "html5"
    browse_button: "pickfiles"
    max_file_size: "10mb"
    url: "/mangas/" + gon.manga_id + "/chapters/" + gon.chapter_id + "/pages"
    multipart: true
    multipart_params:
      authenticity_token: "<%= form_authenticity_token %>"
  )
  uploader.bind "FilesAdded", (up, files) ->
    $.each files, (i, file) ->
      $("#filelist").append "<div id=\"" + file.id + "\">" + "File: " + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"


  uploader.bind "UploadProgress", (up, file) ->
    $("#" + file.id + " b").html file.percent + "%"

  $("#uploadfiles").click (e) ->
    uploader.start()
    e.preventDefault()

  uploader.init()