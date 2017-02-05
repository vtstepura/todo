class PagesController < ApplicationController
  def home
    @tasks = current_user.tasks
  end
end
