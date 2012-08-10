require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
    @chapter = chapters(:one)
    @manga = @chapter.manga
  end

  test "should get new" do
    get :new, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { number: @page.number, image: Rails.root.join('public/images/test.jpg') }, :manga_id => @manga.id, :chapter_id => @chapter.id
    end

    assert_redirected_to manga_chapter_page_path(@manga, @chapter, assigns(:page))
  end

  test "should show page" do
    get :show, id: @page, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page, page: { number: @page.number, image: Rails.root.join('public/images/test.jpg') }, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_redirected_to manga_chapter_path(@manga, @chapter)
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page, :manga_id => @manga.id, :chapter_id => @chapter.id
    end

    assert_redirected_to manga_chapter_path(@manga, @chapter)
  end
end
