class Mail < Volt::Model
  # belongs_to :user

  # permissions(:index, :show, :delete) do
  #   # Only the person who created the post can delete or update it
  #   deny unless owner?
  # end
end