class WelcomeController < ApplicationController
  def index
    render layout: "welcome"
    @user=User.new
  end
end
