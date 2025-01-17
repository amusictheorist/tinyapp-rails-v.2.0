module ApplicationHelper
  def generate_random_string
    SecureRandom.urlsafe_base64(6)
  end
end
