class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :hidden_params, only: [:new]

  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
  end

  def destroy
    current_user.tickets.find(params[:id]).destroy
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :pas_name, :pas_pasport)
  end

  def hidden_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

end