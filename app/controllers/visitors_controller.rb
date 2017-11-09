class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :upload

  def index
    @photo = Photo.order('id desc').first
  end

  #TODO basic http auth?
  def upload
    key = "#{Time.now.to_s(:db).gsub(/[ :]/, ?-)}.jpg"
    obj = upload_to_s3(key)
    Photo.create!(path: key)

    render plain: obj.public_url
  end

  private

    def upload_to_s3(key)
      s3 = Aws::S3::Resource.new
      s3.bucket('potrerohillcam').object(key).tap do |obj|
        obj.upload_file(params[:image].tempfile, acl: 'public-read')
      end
    end
end
