module ParksHelper
	include ActsAsTaggableOn::TagsHelper

	def icon_name(flag, color)
		flag.to_s.gsub(/has_/, '') + "-icon-#{color}.png"
	end
end
