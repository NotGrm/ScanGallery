require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase
  setup do
    @chapter = chapters(:one)
    @manga = mangas(:one)
  end

  test "should get new" do
    get :new, :manga_id => @manga.id
    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
      post :create, chapter: { number: @chapter.number}, :manga_id => @manga.id
    end

    assert_redirected_to new_manga_chapter_page_path(@manga, assigns(:chapter))
  end

  test "should show chapter" do
    get :show, id: @chapter, :manga_id =>@manga.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chapter, :manga_id => @manga.id
    assert_response :success
  end

  test "should update chapter" do
    put :update, id: @chapter, chapter: { number: @chapter.number }, :manga_id => @manga.id
    assert_redirected_to manga_chapter_path(@manga, assigns(:chapter))
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete :destroy, id: @chapter, :manga_id => @manga.id
    end

    assert_redirected_to manga_path(@manga)
  end
end
