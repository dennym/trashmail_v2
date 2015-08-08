class Tenant < Volt::Model
  has_many :mails

  before_save :add_secure

  validate :name, unique: true

  def add_secure
    self._secure = 'awdawfawfaw'
  end
end