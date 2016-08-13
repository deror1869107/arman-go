class HomeController < ApplicationController
  def index

  end

  def json
    output = Plan.last.to_api

    respond_to do |format|
      format.json {
        render :json => output
      }
    end
  end
end
