require 'movie_aggregator'

class PagesController < ApplicationController
  def home
    @movies = Movie.all.limit(20)
    #MovieAggregator.run
  end
end
