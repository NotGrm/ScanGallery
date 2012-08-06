require 'test_helper'

class MangasControllerTest < ActionController::TestCase
  setup do
    @manga = mangas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mangas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manga" do
    assert_difference('Manga.count') do
      post :create, manga: { name: @manga.name }
    end

    assert_redirected_to manga_path(assigns(:manga))
  end

  test "should show manga" do
    get :show, id: @manga
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manga
    assert_response :success
  end

  test "should update manga" do
    put :update, id: @manga, manga: { name: @manga.name }
    assert_redirected_to manga_path(assigns(:manga))
  end

  test "should destroy manga" do
    assert_difference('Manga.count', -1) do
      delete :destroy, id: @manga
    end

    assert_redirected_to mangas_path
  end
end
