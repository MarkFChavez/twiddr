module Searchable
	extend ActiveSupport::Concern

	module ClassMethods
		def search(name)
			where("name LIKE ?", "%#{name}%")
		end
	end
end