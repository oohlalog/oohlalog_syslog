require 'yaml'
module OohlalogSyslog
  class Configuration
    def initialize(file)
      @config = YAML::load(File.open(file))
    end

    def config
      return @config
    end
  end
end
