module ApplicationHelper

  def all_group_members(group)
    @all_members = []
    group.users.map do |user|
      @all_members << user
    end
  end

  def pending(group)
    @pending = []
    group.users.each do |user|
      if user.user_status == 'pending'
        @pending << user
      end
    end
  end

  def approved(group)
    @approved = []
    group.users.each do |user|
      if user.user_status == 'approved'
        @approved << user
      end
    end
  end

  def avatar(user)
    if user.avatar.file.nil?
      image_path("placeholder.jpg")
    else
      user.avatar.url
    end
  end

  def group_admin?(group)
    if current_user.group_id == group.id && current_user.admin == true
      true
    end
  end
end
