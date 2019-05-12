module ApplicationHelper
  def full_name(resource)
    "#{resource.first_name} #{resource.last_name}"
  end
end
