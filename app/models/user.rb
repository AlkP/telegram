class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :trackable, :lockable

  enum role:    %i[guest admin]
  enum status:  %i[active archive]
end
