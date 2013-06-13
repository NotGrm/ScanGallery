class PagesController < ApplicationController
  prepend_before_filter :get_manga
  prepend_before_filter :get_chapter

  after_filter :mark_page_as_read

  layout "reader", :only => [:show]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

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

    ariane.add "Add Pages", '#'

    gon.manga_id = @manga.permalink
    gon.chapter_id = @chapter.number

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find_by_number(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    # @page = @chapter.pages.build(params[:page])

    # respond_to do |format|
    #   if @page.save
    #     format.html { redirect_to [@manga, @chapter, @page], notice: 'Page was successfully created.' }
    #     format.json { render json: @page, status: :created, location: @page }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @page.errors, status: :unprocessable_entity }
    #   end
    # end
    @page = @chapter.pages.build(:image => params[:file])

    if @page.save
      head 200
    else
      render :action => "new"
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find_by_number(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to [@manga, @chapter], notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find_by_number(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to manga_chapter_url(@manga, @chapter) }
      format.json { head :no_content }
    end
  end

  private
  def get_manga
    @manga = Manga.find_by_permalink!(params[:manga_id])
  end

  def get_chapter
    @chapter = Chapter.find_by_number(params[:chapter_id])
  end

  def set_ariane
    super    
    ariane.add @manga.name, manga_path(@manga)
    ariane.add "#{@chapter.number}", manga_chapter_path(@manga,@chapter)
  end

  def mark_page_as_read
    @page.mark_as_read
  end

end
