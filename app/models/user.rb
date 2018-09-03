class User < ApplicationRecord
  attr_accessor :login
  has_and_belongs_to_many :groups
  has_many :ticket_slas
  after_initialize :set_pw_defaults

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  def set_pw_defaults
    if self.new_record?
      self.password ||= 'password'
      self.password_confirmation ||= 'password'
    end
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |r|
        csv << r.attributes.values_at(*column_names)
      end
    end
  end

end
