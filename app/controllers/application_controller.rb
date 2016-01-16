class ApplicationController < ActionController::API

  rescue_from ActionController::BadRequest do
    render nothing: true, status: :bad_request
  end
end
