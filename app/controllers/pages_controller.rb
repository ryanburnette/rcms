class PagesController < ApplicationController

  private

    def set_page
      @page = Page.friendly.find(params[:id])
    end

end
