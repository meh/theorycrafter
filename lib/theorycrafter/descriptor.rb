#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'ostruct'

module Theorycrafter
	class Descriptor < BasicObject
		def self.make(value = nil, &block)
			if block
				::OpenStruct.new(to_h(&block))
			elsif ::Hash === value || ::Array === value
				::OpenStruct.new ::Hash[value.map {|k, v|
					next k, (::Hash === v ? make(v) : v)
				}]
			end
		end

		def self.to_h(&block)
			new(&block).to_h
		end

		def initialize(&block)
			@data = {}

			instance_exec(&block)
		end

		def method_missing(name, *values, &block)
			if block
				@data[name] = Descriptor.make(&block)
			elsif values.length == 1
				@data[name] = values[0]
			elsif values.length > 1
				@data[name] = values
			else
				@data[name]
			end
		end

		def to_h
			@data
		end
	end
end
