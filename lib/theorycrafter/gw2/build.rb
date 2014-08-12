#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Theorycrafter::GW2
	class Build
		def self.const_missing(mod)
			mod.to_s
		end

		def initialize(string)
			instance_eval(string)
		end

		def profession(value)
			@profession = value
		end

		def race(value)
			@race = value
		end

		def weapon(*args)
			if args.length == 3
				type, stats, sigils = args

			elsif args.length == 6
				type, stats, sigils, *args = args
			end
		end
	end
end
