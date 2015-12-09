class JoinGroupOptions 
  attr_reader :group, :current_user

  def initialize(group, current_user)
    @group = group
    @current_user = current_user
  end

  # def member?
  #   if group.users.include?(current_user)
  #     'groups/leave_group_options'
  #   else
  #     'groups/join_group_options'
  #   end
  # end

  def member?
    if UserGroup.find_by(group_id: group.id, user_id: current_user.id)
      'groups/leave_group_options'
    else
      'groups/join_group_options'
    end
  end

end