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
	class Weapon
		DAMAGE = TC::Descriptor.make do
			axe do
				exotic   [857, 1048]
				ascended [900, 1100]
			end

			dagger do
				exotic   [924, 981]
				ascended [970, 1030]
			end

			focus do
				exotic   [832, 883]
				ascended [940, 1060]
			end

			greatsword do
				exotic   [995, 1100]
				ascended [1045, 1155]
			end

			hammer do
				exotic   [985, 1111]
				ascended [1034, 1166]
			end

			longbow do
				exotic   [920, 1080]
				ascended [966, 1134]
			end

			mace do
				exotic   [895, 1010]
				ascended [940, 1060]
			end

			pistol do
				exotic   [876, 1029]
				ascended [920, 1080]
			end

			rifle do
				exotic   [986, 1205]
				ascended [1035, 1265]
			end

			scepter do
				exotic   [895, 1010]
				ascended [940, 1060]
			end

			shield do
				exotic   [806, 909]
				ascended [846, 954]
			end

			shortbow do
				exotic   [905, 1000]
				ascended [950, 1050]
			end

			staff do
				exotic   [985, 1111]
				ascended [1034, 1166]
			end

			sword do
				exotic   [905, 1000]
				ascended [950, 1050]
			end

			torch do
				exotic   [789, 926]
				ascended [828, 972]
			end

			warhorn do
				exotic   [814, 900]
				ascended [855, 945]
			end
		end

		ATTRIBUTES = TC::Descriptor.make Attributes::HASH.map {|name, (major, minor1, minor2)|
			if name == :celestial
				[]
			else
				next [name, one: { major => 90, minor1 => 64, minor2 => 64 },
				            two: { major => 179, minor1 => 128, minor2 => 128 }],
				     [Attributes.ascended(name), one: { major => 94, minor1 => 67, minor2 => 67 },
				                                 two: { major => 188, minor1 => 134, minor2 => 134 }]
			end
		}.flatten(1)

		attr_reader :type, :name, :sigils

		def initialize(type, name, sigils = nil)
			@type   = type.downcase.to_sym
			@name   = name.downcase.to_sym
			@sigils = Array(sigils).map { |s| Sigil.new(s) }
		end

		def exotic?
			Attributes.exotic?(@name)
		end

		def ascended?
			Attributes.ascended?(@name)
		end

		def one_handed?
			%i[axe dagger focus mace pistol scepter shield sword torch warhorn].include?(@type)
		end

		def two_handed?
			%i[greatsword hammer longbow rifle shortbow staff].include?(@type)
		end

		def off_hand?
			%i[focus shield torch warhorn].include?(@type)
		end

		DAMAGE.each {|type, _|
			define_method "#{type}?" do
				@type == type
			end
		}

		def damage
			DAMAGE[@type][exotic? ? :exotic : :ascended]
		end

		def defense
			if shield?
				exotic? ? 61 : 64
			else
				0
			end
		end

		def attributes
			ATTRIBUTES[@name][one_handed? ? :one : :two]
		end
	end
end
