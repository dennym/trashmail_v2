class Tenant < Volt::Model
  has_many :mails

  validate :name, unique: true
end