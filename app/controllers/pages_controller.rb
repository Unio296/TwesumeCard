class PagesController < ApplicationController
  def home
    if logged_in?
      @resumes = current_user.resumes.all
      #debugger
    end

  end

  def terms
  end

  def privacy
  end

  def contact
  end
end
