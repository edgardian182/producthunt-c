# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  password_digest :string
#  name            :string(100)
#  twitter_handle  :string(50)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password validations: false

  has_many :products
  has_many :comments

  validates :email, uniqueness: true, format: /@/   #Que tenga un @
  validates :password, presence: true, on: :create  #Que exista al crearse
  validates :password, length: { in: 6..20 }, allow_nil: true  #Que contraseña sea entre 6-20 caracteres y al editar puede estar nulo
  validates :name, presence: true
end
