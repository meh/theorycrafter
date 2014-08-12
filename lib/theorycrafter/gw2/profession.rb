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
	class Profession
		SKILLS = TC::Descriptor.make do

		end

		WEAPONS = TC::Descriptor.make do
			guardian do
				greatsword ['Strike', 'Vengeful Strike', 'Wrathful Strike'],
				           'Whirling Wrath',
				           'Leap of Faith',
				           'Symbol of Wrath',
				           ['Binding Blade', 'Pull']

				hammer ['Hammer Swing', 'Hammer Bash', 'Symbol of Protection'],
				       'Mighty Blow',
				       "Zealot's Embrace",
				       'Banish',
				       'Ring of Warding'

				staff 'Wave of Wrath',
				      ['Orb of Light', 'Detonate Orb of Light'],
				      'Symbol of Swiftness',
				      'Empower',
				      'Line of Warding'

				mace ['True Strike', 'Pure Strike', 'Faithful Strike'],
				     'Symbol of Faith',
				     "Protector's Strike",
				     nil,
				     nil

				scepter 'Orb of Wrath',
				        'Smite',
				        'Chains of Light',
				        nil,
				        nil

				sword ['Sword of Wrath', 'Sword Arc', 'Sword Wave'],
				      'Flashing Blade',
				      "Zealot's Defense"

				focus nil,
				      nil,
				      nil,
				      'Ray of Judgement',
				      'Shield of Wrath'

				shield nil,
				       nil,
				       nil,
				       'Shield of Judgement',
				       ['Shield of Absorption', 'Shield of Absorption']

				torch nil,
				      nil,
				      nil,
				      ["Zealot's Flame", "Zealot's Fire"],
				      'Cleansing Flame'

				spear 'Spear of Light',
				      "Zealot's Flurry",
				      'Brilliance',
				      'Spear Wall',
				      'Wrathful Grasp'

				trident 'Light of Judgment',
				        ['Purify', 'Purifying Blast'],
				        'Pillar of Light',
				        'Refraction',
				        'Weight of Justice'
			end
		end

		attr_reader :name

		def initialize(name)
			@name = name
		end

		%i[elementalist engineer guardian mesmer necromancer ranger thief warrior].each {|name|
			define_method "#{name}?" do
				@name == name
			end
		}

		def health
			if elementalist? or thief? or guardian?
				1_645
			elsif ranger? or engineer? or mesmer?
				5_922
			elsif warrior? or necromancer?
				9_212
			end
		end
	end
end
