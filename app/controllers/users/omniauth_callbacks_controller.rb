# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # -- -------------------------------------------------------------------------
    # -- Constants ---------------------------------------------------------------

    # -- -------------------------------------------------------------------------
    # -- Concerns ----------------------------------------------------------------

    # -- -------------------------------------------------------------------------
    # -- Extensions --------------------------------------------------------------

    # -- -------------------------------------------------------------------------
    # -- Callbacks ---------------------------------------------------------------

    # -- -------------------------------------------------------------------------
    # -- Actions -----------------------------------------------------------------

    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    # def twitter
    # end

    # More info at:
    # https://github.com/heartcombo/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    # -- -------------------------------------------------------------------------
    # -- Protected Methods -------------------------------------------------------

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end

    # -- -------------------------------------------------------------------------
    # -- Private Methods ---------------------------------------------------------

    # private
  end
end
