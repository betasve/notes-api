class ApplicationController < ActionController::API

  before_action :ensure_request_type

  rescue_from ActionController::BadRequest do
    render nothing: true, status: :bad_request
  end

  def ensure_request_type
    if request.content_type != "application/json"
      raise ActionController::BadRequest
    end
  end
end
