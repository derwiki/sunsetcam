class Photo < ApplicationRecord
  def url
    Aws::S3::Resource.new.bucket('potrerohillcam').object(self.path).public_url
  end
end
