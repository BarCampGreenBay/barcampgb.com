class PresentationsController < ApplicationController
  before_action :login!, except: [:index]
  before_action :get_presentation, only: [:edit, :update]

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

  def edit
  end

  def update
    if @presentation.update_attributes(presentation_params)
      flash[:success] = 'Presentation updated successfully!'
      redirect_to presentations_path
    else
      render :edit
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

  def get_presentation
    @presentation = Presentation.find(params[:id])
    raise ActiveRecord::RecordNotFound unless @presentation.presenter == current_user
  end
end
