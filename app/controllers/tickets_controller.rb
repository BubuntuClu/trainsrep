class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :hidden_params, only: [:new]
  before_action :set_ticket, only: [:show, :edit, :update]

  def index
    if current_user.admin?
      @tickets =Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  def show
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

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end
  

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :pas_name, :pas_pasport)
  end

  def hidden_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

end