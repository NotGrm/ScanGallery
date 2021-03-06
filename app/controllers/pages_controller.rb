class PagesController < ApplicationController
  prepend_before_filter :get_manga_and_chapter

  after_filter :mark_page_as_read, :only => [:show]

  layout "reader", :only => [:show]

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = @chapter.pages.find_by_number(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = @chapter.pages.build

    gon.manga_id = @manga.slug
    gon.chapter_id = @chapter.number

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = @chapter.pages.build(:image => params[:file])

    if @page.save
      head 200
    else
      render :action => "new"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = @chapter.pages.find_by_number(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to manga_chapter_url(@manga, @chapter) }
      format.json { head :no_content }
    end
  end

  private
  def get_manga_and_chapter
    @manga = Manga.find(params[:manga_id])
    @chapter = @manga.chapters.find_by_number(params[:chapter_id])
  end

  def mark_page_as_read
    @page.is_read = true
    @page.save
  end

end
