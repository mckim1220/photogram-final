module FollowersHelper
  def get_user_name(id)
      user = User.find_by(id:id)
      user.username
  end
end
