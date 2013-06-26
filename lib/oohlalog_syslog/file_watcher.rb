require 'oohlalog'

require 'file/tail'

class OohlalogSyslog::FileWatcher
	def initialize(filename, options = {})
		@filename = filename
		@category = options["category"] || "NA"
		@options = options
		@logger = Oohlalog::Logger.new(100, 0, options)
	end

	def run
		File::Tail::Logfile.open(@filename) do |log|
			log.tail do |line|
				if @options.has_key?("error_pattern") && line.match(@options["error_pattern"])
					@logger.error(line, @category)
				elsif @options.has_key?("fatal_pattern") && line.match(@options["fatal_pattern"])
					@logger.fatal(line, @category)
				elsif @options.has_key?("warn_pattern") && line.match(@options["warn_pattern"])
					@logger.warn(line, @category)
				elsif @options.has_key?("info_pattern") && line.match(@options["info_pattern"])
					@logger.info(line, @category)
				else
					@logger.info(line, @category)
				end
			end
		end
	end


end
