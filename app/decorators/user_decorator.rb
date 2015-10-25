class UserDecorator < BaseDecorator

  def name_or_mail
    humanize_name || email
  end
  private

  def humanize_name
    name.presence.try(:humanize).try(:titleize)
  end
end
