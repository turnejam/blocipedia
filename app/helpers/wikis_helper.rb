module WikisHelper
  def user_is_authorized_to_create_private_wikis?(wiki)
    user.admin? || user.premium?
  end
end
