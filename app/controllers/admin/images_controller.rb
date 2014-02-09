class Admin::ImagesController < ImagesController

  before_action :authenticate_admin_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :require_super_admin!, only: [:destroy]

  layout "admin"

  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to edit_admin_image_path(@image), notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to edit_admin_image_path(@image), notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to admin_images_url, notice: 'Image was successfully destroyed.'
  end

  private

    def image_params
      params.require(:image).permit(:title, :slug, :alt, :image)
    end

end