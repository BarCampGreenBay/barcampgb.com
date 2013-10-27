class PresentationsController < ApplicationController
  before_action :login!

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      flash[:success] = 'Presentation created successfully!'
      redirect_to presentations_path
    else
      render :new
    end
  end

  def attend
  end

  def unattend
  end

  private

  def presentation_params
    params.require(:presentation).permit(:title, :description)
  end
end
