class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @cars = Car.all
  end

  def show
    render "#{@car.car_type}_car.html.erb"
  end

  def new
    @train = Train.find(params[:train_id])
    @car = Car.new
  end

  def edit
  end

  def create
    @car = @train.cars.new(car_params)
    if @car.save
      redirect_to [:admin, @train], notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to [:admin, @car.train], notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to admin_cars_url, notice: 'Car was successfully destroyed.'
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    def car_params
      params.require(:car).permit(:number, :car_type, :up_space, :low_space, :side_up_space, :side_low_space, :seat_space)
    end
end
