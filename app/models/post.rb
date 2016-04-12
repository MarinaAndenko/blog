class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	validates_presence_of :name, :description, :text
	validates_uniqueness_of :name
end
