class User < ApplicationRecord
  after_create :assign_default_role
  
  rolify
  
  def assign_default_role
    add_role(:student)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :club
end
