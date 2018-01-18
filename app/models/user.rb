class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :trackable, :lockable

  enum role:    %i[guest admin]
  enum status:  %i[active archive]

  paginates_per 9

  scope :sorting, -> (cookies) { order(cookies[:sort].to_sym => cookies[:sort_index].to_sym) unless cookies[:sort].nil? or cookies[:sort_index].nil? }
end
