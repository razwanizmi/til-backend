module Api
  class ApplicationController < ActionController::API
    undef_method :current_user
    include Knock::Authenticable
  end
end
