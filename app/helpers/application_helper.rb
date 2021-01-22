require 'digest/md5'

module ApplicationHelper

  def get_user_image(email_address)
    hash = Digest::MD5.hexdigest(email_address)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
