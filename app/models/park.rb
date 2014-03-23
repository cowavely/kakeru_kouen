class Park < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	acts_as_taggable_on :tags

	#before_save :set_flags

	FLAGS = { 
		has_toilet: 1, 
		has_water: 1 << 1, 
		has_nature: 1 << 2, 
		has_bench: 1 << 3, 
		has_parking: 1 << 4, 
		has_sports: 1 << 5, 
		has_playground: 1 << 6 
	}

	def has_flag?(flag_key)
		(self.flags & Park::FLAGS[flag_key]) != 0
	end

	def flag_list
		flags = []
		Park::FLAGS.each do |k, v|
			if self.has_flag?(k)
				flags << k
			end
		end
		flags
	end


	def set_flags(flags_list)
		self.flags = 0
		flags_list.each do |k, v|
   		   	if v == "1"
        		self.flags = self.flags | Park::FLAGS[k.to_sym]
      		end
    	end
	end

	# def set_flags
	# 	params[:park][:flags].each { |k,v| flags = flags | Park::FLAGS[k] }
	# end
end
