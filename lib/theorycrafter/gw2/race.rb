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
	class Race
		SKILLS = TC::Descriptor.make do
			asura do
				utility 'Pain Inverter', 'Radiation Field', 'Technobabble'
				elite   'Summon 7-Series Golem', 'Summon D-Series Golem',
				        'Summon Power Suit'
			end

			charr do
				utility 'Battle Roar', 'Hidden Pistol', 'Shrapnel Mine'
				elite   'Artillery Barrage', 'Charrzooka', 'Warband Support'
			end

			human do
				heal    'Prayer to Dwayna'
				utility 'Prayer to Kormir', 'Prayer to Lyssa'
				elite   'Avatar of Melandru', 'Hounds of Balthazar',
				        'Reaper of Grenth'
			end

			norn do
				utility 'Call Owl', 'Call Wurm'
				elite   'Become the Bear', 'Become the Raven',
				        'Become the Snow Leopard', 'Become the Wolf'
			end

			sylvari do
				heal    'Healing Seed'
				utility 'Grasping Vines', 'Seed Turret'
				elite   'Summon Druid Spirit', 'Summon Sylvan Hound',
				        'Take Root'
			end
		end

		attr_reader :name

		def initialize(name)
			@name = name.downcase.to_sym
		end

		%i[asura charr human norn sylvari].each {|name|
			define_method "#{name}?" do
				@name == name
			end
		}

		def heal
			Array(SKILLS[@name].heal).map { |n| Skill[n] }
		end

		def utility
			Array(SKILLS[@name].utility).map { |n| Skill[n] }
		end

		def elite
			Array(SKILLS[@name].elite).map { |n| Skill[n] }
		end
	end
end
