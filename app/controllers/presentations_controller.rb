class PresentationsController < ApplicationController
  before_action :login!, :except => [:index]

  def index
    @presentations = Presentation.order("RANDOM()")
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.presenter = current_user

    if @presentation.save
      @presentations = Presentation.all.order('created_at DESC')
      render :success
    else
      render :error
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
