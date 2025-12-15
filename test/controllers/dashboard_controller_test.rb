# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should show dashboard when authenticated' do
    user = create(:user)
    sign_in user

    get authenticated_root_url

    assert_response :success
  end

  test 'should show public page when not authenticated' do
    get root_url

    assert_response :success
  end
end
