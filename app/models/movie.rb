class Movie < ApplicationRecord
  mount_uploader :main_image, ImageUploader
end
