class Album < ApplicationRecord
	has_many :reviews
	belongs_to :user
	validates :title, presence: true
	
	has_attached_file :cover, styles: { medium: "400x400!", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
