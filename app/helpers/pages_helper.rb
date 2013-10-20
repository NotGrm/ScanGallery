module PagesHelper
  def next_page_path
    if @page.next_page.nil?
      manga_path(@manga)
    else
      manga_chapter_page_path(@manga, @chapter, @page.next_page.number)
    end
  end

  def previous_page_path
    if @page.previous_page.nil?
      manga_path(@manga)
    else 
      manga_chapter_page_path(@manga, @chapter, @page.previous_page.number)
    end
  end
end
