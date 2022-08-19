# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
List.destroy_all
list_names = ["Comedy", "Drama", "Action", "Horror"]
list_names.each do |list_name|
  List.create!(name: list_name)
end

Movie.destroy_all
url = "http://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
movies = JSON.parse(response)

10.times do
  movies["results"].each do |movie|
    Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
  end
end

# "#{user["name"]} - #{user["bio"]}"
