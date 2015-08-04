class Mail < Volt::Model
  belongs_to :tenant

  permissions do
  end
end