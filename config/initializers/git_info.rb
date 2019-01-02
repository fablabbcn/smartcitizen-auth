if File.exists?('VERSION')
  VERSION_FILE = `cat VERSION`
else
  VERSION_FILE = '.'
end
