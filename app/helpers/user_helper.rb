module UserHelper
  def user_or_users(workers)
    if workers == 1
      html = "<i class='fas fa-user'></i>".html_safe
    else
      html = "<i class='fas fa-user-friends'></i>".html_safe
    end
  end
end
