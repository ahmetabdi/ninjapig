require "http"

class MovieAggregator
  def self.run
    new.run
  end

  def run
    puts "running..."
    puts json_file_paths
    json_file_paths.each do |file_path|
      file = File.read(file_path)
      data = JSON.parse(file)

      data['movies'].each do |movie|
        Movie.where(title: movie['title']).first_or_create do |m|
          # image = open(movie['image'])
          # return if image.nil?
          # raise image.inspect
          m.remote_main_image_url = movie['image']
          m.location = movie['location']
          m.rating = movie['rating']
          m.url = movie['url']
        end
      end
    end
  end

  private

  def json_file_paths
    Dir.glob("#{Rails.root}/lib/node-salts/db/*.json")
  end
end
