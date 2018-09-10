class Course < ApplicationRecord
	has_many :mods, dependent: :destroy
end
