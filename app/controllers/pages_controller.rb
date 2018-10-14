class PagesController < ApplicationController
  def home
    if logged_in?
      @resume = current_user.resumes.build
    end

  end

  def terms
  end

  def privacy
  end

  def contact
  end
end
