#encoding: utf-8
require 'digest/sha2'
class User < ActiveRecord::Base
	has_many :cards

  attr_protected :hashed_password, :enabled
  attr_accessor :password
  validates_presence_of :name, :message => '^укажите свое имя'
  validates_presence_of :email, :message => '^укажите свой email'
  #validates_presence_of :password, :if => :password_required?, :message => '^укажите пароль'
  #validates_presence_of :password_confirmation, :if => :password_required?, :message => '^необходимо указать пароль повторно'

  #validates_confirmation_of :password, :if => :password_required?, :message => '^пароль не совпадает с подтверждением'
  #validates_uniqueness_of :name, :case_sensitive => false, :message => '^пользователь с таким именем уже зарегистрирован'
  #validates_uniqueness_of :email, :case_sensitive => false, :message => '^email уже используется'
  validates_length_of :name, :within => 3..64, :message => '^имя должно содержать больше 3 символов'
  validates_length_of :email, :within => 5..128, :message => '^email должен содержать больше 3 символов'
  #validates_length_of :password, :within => 4..20, :if => :password_required?, :message => '^пароль должен быть длинее 3 символов'
  validates_length_of :info, :maximum => 1000, :message => '^слишком много информации'

  def before_save
    self.hashed_password = User.encrypt(password) if !self.password.blank?
  end

  def password_required?
    self.hashed_password.blank? || !self.password.blank?
  end

  def self.encrypt(string)
  	return Digest::SHA256.hexdigest(string)
  end

  def self.authenticate(username, password)
    find_by_name_and_hashed_password(username, User.encrypt(password))
  end

  def self.random_string(len)
   #generate a random password consisting of strings and digits
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
 end

end
