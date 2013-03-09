# zuerst core danach alles
Dir[File.dirname(__FILE__) + "/app/core/**/*.rb"].each do |file|
  require_relative file
end

Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each do |file|
  require_relative file
end
