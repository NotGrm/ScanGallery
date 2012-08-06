class MangasController < ApplicationController
  # GET /mangas
  # GET /mangas.json
  def index
    @mangas = Manga.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mangas }
    end
  end

  # GET /mangas/1
  # GET /mangas/1.json
  def show
    @manga = Manga.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manga }
    end
  end

  # GET /mangas/new
  # GET /mangas/new.json
  def new
    @manga = Manga.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manga }
    end
  end

  # GET /mangas/1/edit
  def edit
    @manga = Manga.find(params[:id])
  end

  # POST /mangas
  # POST /mangas.json
  def create
    @manga = Manga.new(params[:manga])

    respond_to do |format|
      if @manga.save
        format.html { redirect_to @manga, notice: 'Manga was successfully created.' }
        format.json { render json: @manga, status: :created, location: @manga }
      else
        format.html { render action: "new" }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mangas/1
  # PUT /mangas/1.json
  def update
    @manga = Manga.find(params[:id])

    respond_to do |format|
      if @manga.update_attributes(params[:manga])
        format.html { redirect_to @manga, notice: 'Manga was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mangas/1
  # DELETE /mangas/1.json
  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy

    respond_to do |format|
      format.html { redirect_to mangas_url }
      format.json { head :no_content }
    end
  end
end
