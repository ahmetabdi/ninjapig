require 'open-uri'

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
        Movie.where(title: movie['title']).first_or_create(main_image: open(movie['image']), location: movie['location'], rating: movie['rating'], url: movie['url'])
      end
    end
  end

  private

  def json_file_paths
    Dir.glob("#{Rails.root}/lib/node-salts/db/*.json")
  end
end
