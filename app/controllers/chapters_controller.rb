class ChaptersController < ApplicationController
  prepend_before_filter :get_manga
  before_filter :get_teams, only: [:new, :edit] 

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find_by_number(params[:id])

    ariane.add "#{@chapter.number}", @chapter

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chapter }
    end
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = @manga.chapters.build

    ariane.add 'New chapter', new_manga_chapter_path(@manga)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find_by_number(params[:id])
    

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
        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
    @chapter = Chapter.find_by_number(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to [@manga, @chapter], notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = Chapter.find_by_number(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to manga_url(@manga) }
      format.json { head :no_content }
    end
  end

  private
  def get_manga
    @manga = Manga.find_by_permalink!(params[:manga_id])
  end

  def get_teams
    @teams = Chapter.uniq.pluck(:team)
  end

  def set_ariane
    super
    ariane.add @manga.name, manga_path(@manga)
  end
end
