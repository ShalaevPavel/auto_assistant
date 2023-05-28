class WorksController < InheritedResources::Base
  def new
    @user_cars = current_user.cars
    @work = Work.new
    super
  end

  def create
    @work = Work.new(work_params)
    aadda
    car = Car.find(params[:work][:car_id])
    if car.log
      log = car.log
      field_value = params[:work][:service_work].gsub(/\s+/, "")
      if log.respond_to?(field_value)
        new_value = params[:work][:next_appointment]
        log[field_value] = new_value



        if @work.save
          log.save
          user_id = current_user.id
          Resque.enqueue(NotificationJob, user_id, @work.id)
        end
      else
        @work.save
      end

    end
    super
  end

  private

  def work_params
    params.require(:work).permit(:car_id, :service_work, :next_appointment, :service_name)
  end

end
