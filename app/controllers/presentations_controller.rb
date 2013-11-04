class PresentationsController < ApplicationController
  before_action :login!

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = current_user.presentation.new(presentation_params)

    if @presentation.save
      flash[:success] = 'Presentation created successfully!'
      redirect_to presentations_path
    else
      render :new
    end
  end

  def attend
    @presentation = Presentation.find(params[:id])

    if current_user.presentations.where(id: @presentation.id).any?
      current_user.presentations.delete(@presentation)
    else
      current_user.presentations << @presentation
    end
  end

  private

  def presentation_params
    params.require(:presentation).permit(:title, :description)
  end
end
