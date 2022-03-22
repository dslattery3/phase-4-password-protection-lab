class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private
  def render_invalid(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessble_entity
  end

  def render_not_found(error)
    render json: {error: "#{error.model} not found"}, status: :render_not_found
  end

end
