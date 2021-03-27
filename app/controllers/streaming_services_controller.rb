class StreamingServicesController < ApplicationController
  COULD_NOT_CREATE_ERROR = "Could not add service to your set of services".freeze

  def index
    render(json: valid_response(StreamingService.all))
  end

  def create
    service = StreamingService.new(service_params)
    if service.save
      render(json: valid_response(service))
    else
      render(json: invalid_response(service, error: COULD_NOT_CREATE_ERROR))
    end
  end

  def destroy
    service = StreamingService.find(params[:id])
    if service.destroy
      render(status: 204, json: "Service #{service.title} removed")
    else
      render(json: invalid_response(service, error: could_not_remove_error(service.title)))
    end
  end

  private

  def service_params
    params.require(:service).permit(:title)
  end

  def could_not_remove_error(service_title)
    "Could not remove #{service_title} from your list of services"
  end
end
