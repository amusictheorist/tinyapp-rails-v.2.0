module ApplicationHelper
  def generate_random_string
    SecureRandom.alphanumeric(6)
  end
end
