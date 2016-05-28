require 'movie_aggregator'

namespace :movie do
  desc "TODO"
  task aggregate: :environment do
    MovieAggregator.run
  end

end
