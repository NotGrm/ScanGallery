module PagesHelper
  def next_page_path
    if @page.next_page.nil?
      manga_path(@manga)
    else
      page = @page.next_page
      chapter = page.chapter
      manga_chapter_page_path(@manga, chapter, page.number)
    end
  end

  def previous_page_path
    if @page.previous_page.nil?
      manga_path(@manga)
    else
      page = @page.previous_page
      chapter = page.chapter
      manga_chapter_page_path(@manga, chapter, page.number)
    end
  end
end
