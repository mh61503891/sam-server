class RootController < ApplicationController

  def index
    redirect_to people_path
    # redirect_to (person_signed_in? ? 'people#index' : 'devise/sessions#new')
  end

end
