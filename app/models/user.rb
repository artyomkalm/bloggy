class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_uniqueness_of    :username 
  validates_presence_of      :password, :on=>:create
  validates_confirmation_of  :password, :on=>:create
  validates_length_of        :password, :within => Devise.password_length, :allow_blank => true
end
