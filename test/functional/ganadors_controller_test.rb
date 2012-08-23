require 'test_helper'

class GanadorsControllerTest < ActionController::TestCase
  setup do
    @ganador = ganadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ganadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ganador" do
    assert_difference('Ganador.count') do
      post :create, ganador: { id_participante: @ganador.id_participante }
    end

    assert_redirected_to ganador_path(assigns(:ganador))
  end

  test "should show ganador" do
    get :show, id: @ganador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ganador
    assert_response :success
  end

  test "should update ganador" do
    put :update, id: @ganador, ganador: { id_participante: @ganador.id_participante }
    assert_redirected_to ganador_path(assigns(:ganador))
  end

  test "should destroy ganador" do
    assert_difference('Ganador.count', -1) do
      delete :destroy, id: @ganador
    end

    assert_redirected_to ganadors_path
  end
end
