class Album < ApplicationRecord
	has_many :reviews
	belongs_to :user
	validates :title, presence: true
	validates :cover, presence: true
	validates :year, presence: true
	validates :artist, presence: true
	
	has_attached_file :cover, styles: { normal: "400x400#", medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", default_style: :normal
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
