class Present < ActiveRecord::Base
	has_one :dcard, :through => :user
end
