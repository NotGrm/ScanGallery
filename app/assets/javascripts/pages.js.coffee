$ ->
  
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
