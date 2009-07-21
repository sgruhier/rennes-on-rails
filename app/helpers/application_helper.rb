# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash
    [:notice, :success, :failure].inject("") do |html, key|
      html += content_tag(:div, flash[key], :class => key) if flash[key]
      html
    end
  end
  
end
