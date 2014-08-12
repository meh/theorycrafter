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
	class Skill
		@@hash = {}

		def self.define(name, &block)
			@@hash[name] = Class.new Skill do
				name name
				instance_exec(&block)
			end
		end

		def self.[](name)
			@@hash[name]
		end

		%i[name description type damage radius range finisher field duration].each {|name|
			define_singleton_method name do |value = nil|
				if value
					instance_variable_set "@#{name}", value
				else
					instance_variable_get "@#{name}"
				end
			end
		}

		%i[activation recharge].each {|name|
			define_singleton_method name do |value = nil|
				if value
					instance_variable_set "@#{name}", Rational(value)
				else
					instance_variable_get "@#{name}"
				end
			end
		}

		def use(by, on)

		end
	end
end
