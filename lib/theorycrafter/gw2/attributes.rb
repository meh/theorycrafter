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
	module Attributes
		ASCENDED = TC::Descriptor.to_h do
			berserker  :zojja
			soldier    :ahamid
			valkyrie   :gobrech
			zealot     :keeper
			assassin   :saphir
			rampager   :forgemaster
			cavalier   :angchu
			knight     :beigarth
			nomad      :ventari
			settler    :leftpaw
			sentinel   :weiqi
			shaman     :zintl
			carrion    :occam
			dire       :morbach
			rabid      :ferratus
			apothecary :veldrunner
			cleric     :tateos
			magi       :hronk
			celestial  :wupwup
		end

		def self.ascended(name)
			ASCENDED[name]
		end

		def self.exotic(name)
			ASCENDED.key(name)
		end

		def self.exotic?(name)
			ASCENDED.has_key?(name)
		end

		def self.ascended?(name)
			ASCENDED.has_value?(name)
		end

		HASH = TC::Descriptor.to_h do
			berserker :power, :precision, :ferocity
			soldier   :power, :toughness, :vitality
			valkyrie  :power, :vitality,  :ferocity
			zealot    :power, :precision, :healing

			assassin  :precision, :power, :ferocity
			rampager  :precision, :power, :condition

			cavalier  :toughness, :power, :ferocity
			knight    :toughness, :power, :precision
			nomad     :toughness, :vitality, :healing
			settler   :toughness, :condition, :healing

			sentinel  :vitality, :power, :toughness
			shaman    :vitality, :condition, :healing

			carrion   :condition, :power, :vitality
			dire      :condition, :toughness, :vitality
			rabid     :condition, :precision, :toughness

			apothecary :healing, :toughness, :condition
			cleric     :healing, :power, :toughness
			magi       :healing, :precision, :vitality

			celestial :power, :precision, :toughness, :vitality, :condition, :ferocity, :healing
		end

		def self.for(name)
			HASH[name] || HASH[ASCENDED.key(name)]
		end
	end
end
