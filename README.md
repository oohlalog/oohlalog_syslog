# OohlalogSyslog

A syslog/log file tail monitor for forwarding to the oohlalog system.

## Installation

Prerequisites: Ruby 1.9.2 or higher needs to be installed along with rubygems (normally included with ruby)

Install the oohlalog_syslog scripts with:

```
gem install 'oohlalog_syslog'
```


## Usage

To start monitoring your log files you must first configure which files you would like to monitor.

Create a configuration file in `/etc/oohlalog/config.yml`

```
syslog:
	path: /var/log/system.log
	api_key: YOUR_API_KEY
	default_level: INFO
	error_pattern: ERROR
	warn_pattern: WARN
	info_pattern: INFO
```

Multiple log files can be listed here by name (in the example above we are naming this log syslog).
This gives us the ability to tie logging into other services like perhaps your mysql logs, mongo logs, whatever log file you want to monitor really. Regular expressions may also be defined on a file by file basis as shown in hte config above.

To kick off the monitor one can simply test by typing `oohlalog` in the shell. This will startup the monitor script and start forwarding log messages to oohlalog. It will also confirm your config is setup correctly.

To startup a daemon monitor for your logs simply run the `oohlalogd` command. This will also provide you a list of command options that can be used in daemon mode.

We have more updates and detail guide options coming. Please feel free to open any issues and suggest improvements.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
