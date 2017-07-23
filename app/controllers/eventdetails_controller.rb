class EventdetailsController < ApplicationController
  before_action :set_eventdetail, only: [:show, :update, :destroy]

  # GET /eventdetails
  def index
    @eventdetails = Eventdetail.all

    render json: @eventdetails
  end

  # GET /eventdetails/1
  def show
    render json: @eventdetail
  end

  # POST /eventdetails
  def create
    @eventdetail = Eventdetail.new(eventdetail_params)

    if @eventdetail.save
      render json: @eventdetail, status: :created, location: @eventdetail
    else
      render json: @eventdetail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /eventdetails/1
  def update
    if @eventdetail.update(eventdetail_params)
      render json: @eventdetail
    else
      render json: @eventdetail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /eventdetails/1
  def destroy
    @eventdetail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventdetail
      @eventdetail = Eventdetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eventdetail_params
      params.require(:eventdetail).permit(:name, :venue, :date, :time)
    end
end
