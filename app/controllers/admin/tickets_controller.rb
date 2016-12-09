class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update]
  before_action :hidden_params, only: [:new]

  def index
    @tickets =Ticket.all
  end

  def show
  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
  end
  

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :pas_name, :pas_pasport, :user_id)
  end

  def hidden_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

end