require 'test_helper'

class ArtworksControllerTest < ActionController::TestCase
  setup do
    @artwork = artworks(:one)
    @update = {
        title: 'Lorem Ipsum',
        description: 'A great piece of art,A great piece of art,A great piece of art,A great piece of art,A great piece of art',
        image_url: 'image.jpg',
        name: 'artwork name',
        artwork_longtitude: 123456.1,
        artwork_latitude: 123456.1,
        ibeaconuuid: "abcdefghijk"
    }
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:artworks)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create artwork' do
    assert_difference('Artwork.count') do
      post :create, artwork: @update  #{ artwork_latitude: @artwork.artwork_latitude, artwork_longtitude: @artwork.artwork_longtitude, description: @artwork.description, image_url: @artwork.image_url, name: @artwork.name, title: @artwork.title }
    end

    assert_redirected_to artwork_path(assigns(:artwork))
  end

  test 'should show artwork' do
    get :show, id: @artwork
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @artwork
    assert_response :success
  end

  test 'should update artwork' do
    put :update, id: @artwork, artwork: @update
    assert_redirected_to artwork_path(assigns(:artwork))
  end

  test 'should destroy artwork' do
    assert_difference('Artwork.count', -1) do
      delete :destroy, id: @artwork
    end

    assert_redirected_to artworks_path
  end
end
