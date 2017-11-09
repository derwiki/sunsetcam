class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def upload
    render plain: "#{params[:image].tempfile.length} bytes OK"
  end
end
