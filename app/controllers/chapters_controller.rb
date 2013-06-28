class ChaptersController < ApplicationController
  prepend_before_filter :get_manga
  before_filter :get_teams, only: [:new, :edit] 

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = @manga.chapters.find_by_number(params[:id])

    ariane.add "#{@chapter.number}", @chapter

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chapter }
    end
  end

  def add_next
    chapter = @manga.chapters.find_by_number(params[:number])

    respond_to do |format|
      if chapter
        format.html{ redirect_to new_manga_chapter_page_path(@manga, chapter)}
      else
        format.html{ redirect_to new_manga_chapter_path(@manga, :number => params[:number]) }
      end
    end
  end

  # GET /chapters/1/read
  # GET /chapters/1/read.json
  def read
    @chapter = @manga.chapters.find_by_number(params[:id])

    @chapter.pages.each{|page| page.is_read = true}

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to request.referer }
        format.json { render json: @chapter }
      else
      end
    end
  end

  # GET /chapters/1/unread
  # GET /chapters/1/unread.json
  def unread
    @chapter = @manga.chapters.find_by_number(params[:id])

    @chapter.pages.each{|page| page.is_read = false}

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to request.referer }
        format.json { render json: @chapter }
      end
    end
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = @manga.chapters.build(:number => params[:number])

    ariane.add 'New chapter', new_manga_chapter_path(@manga)

    respond_to do |format|
      flash[:warning] = "Chapter already have pages" if @chapter.pages.size > 0
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end

  # GET /chapters/1/edit
  def edit
    @chapter = @manga.chapters.find_by_number(params[:id])
    

    ariane.add "#{@chapter.number}", manga_chapter_path(@manga, @chapter)
    ariane.add 'Edit', edit_manga_chapter_path(@manga, @chapter)

  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = @manga.chapters.build(params[:chapter])

    respond_to do |format|
      if @chapter.save
        # format.html { redirect_to [@manga, @chapter], notice: 'Chapter was successfully created.' }
        format.html { redirect_to new_manga_chapter_page_path(@manga, @chapter), notice: 'Chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else
        get_teams

        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
    @chapter = @manga.chapters.find_by_number(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to [@manga, @chapter], notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        get_teams

        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = @manga.chapters.find_by_number(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to manga_url(@manga) }
      format.json { head :no_content }
    end
  end

  private
  def get_manga
    @manga = Manga.find(params[:manga_id])
  end

  def get_teams
    @teams = Chapter.uniq.pluck(:team)
  end

  def set_ariane
    super
    ariane.add @manga.name, manga_path(@manga)
  end
end
