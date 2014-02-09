class ImagesController < ApplicationController

  private

    def set_image
      @image = Image.friendly.find(params[:id])
    end

end
