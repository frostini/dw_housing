class User
	class Applicant < User
		def applicant?
			true
		end
		def applicant
			'Applicant'
		end
	end
end