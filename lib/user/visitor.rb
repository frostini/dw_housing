class User
	class Visitor < User
		def visitor?
			true
		end
		def visitor
			'Visitor'
		end
	end
end