require 'oohlalog'

require 'file/tail'

class OohlalogSyslog::FileWatcher
	def initialize(filename, options = {})
		@filename = filename
		@category = options["category"] || "NA"
		@options = options
		min_level = options["min_log_level"].to_i || 'DEBUG'
		level = 0
		if min_level == 'INFO'
			level = 1
		elsif min_level == 'WARN'
			level = 2
		elsif min_level == 'ERROR'
			level = 3
		elsif min_level == 'FATAL'
			level = 4
		end
		@logger = Oohlalog::Logger.new(100, level, options)
	end

	def run
		File::Tail::Logfile.open(@filename) do |log|
			log.backward(0)
			log.tail do |line|
				if @options.has_key?("error_pattern") && line.match(@options["error_pattern"])
					@logger.error(line, @category)
				elsif @options.has_key?("fatal_pattern") && line.match(@options["fatal_pattern"])
					@logger.fatal(line, @category)
				elsif @options.has_key?("warn_pattern") && line.match(@options["warn_pattern"])
					@logger.warn(line, @category)
				elsif @options.has_key?("info_pattern") && line.match(@options["info_pattern"])
					@logger.info(line, @category)
				elsif @options.has_key?("debug_pattern") && line.match(@options["debug_pattern"])
					@logger.debug(line, @category)
				else
					@logger.info(line, @category)
				end
			end
		end
	end


end
