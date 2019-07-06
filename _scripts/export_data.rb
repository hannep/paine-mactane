
# This script attempts to output data from posts into a single yml file,
# for potential processing into a database or somewhere else.
# 
# Usage: ruby _scripts/export_data.rb _output.yml

require 'jekyll'
require 'yaml'

all_data = []
config = Jekyll.configuration({})
site = Jekyll::Site::new(config)
site.reset
site.read
site.posts.docs.each do |doc| 
  new_data = doc.data.clone
  new_data.delete("excerpt")
  flavor, directions = doc.content.split("\n\n{% include ingredients.html %}\n\n#### Instructions:\n\n")
  directions = directions.gsub("\n\n{% include tags.html %}", "")
  new_data["flavor"] = flavor
  new_data["directions"] = directions
  all_data.push(new_data)
end

File.write(ARGV[0], YAML::dump(all_data))
