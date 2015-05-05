class Event < ActiveRecord::Base
	belongs_to :dcard
	has_many :presents
end
