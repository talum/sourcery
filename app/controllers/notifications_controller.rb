class NotificationsController < ApplicationController
  def create
    notification = Notification.find_or_create_by(notification_params)
    redirect_to :back, :flash => {:notice => "#{notification.user.gmail_name} has been invited to #{notification.group.topic}"}
  end

private
  def notification_params
    params.require(:notification).permit(:user_id, :group_id, :sender_name)
  end
end