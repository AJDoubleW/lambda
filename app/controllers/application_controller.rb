class ApplicationController < ActionController::API
  private

  def valid_response(object)
    object.as_json
  end

  def invalid_response(object, error:)
    { main_error: error, additional_errors: object.errors.full_messages }.as_json
  end
end
