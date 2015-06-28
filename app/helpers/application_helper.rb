module ApplicationHelper
  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, notice, data: 'alert', class: "ui positive message") if notice
    msg << (content_tag :div, alert, data: 'alert', class: "ui negative message") if alert
    sanitize msg
  end

    # Create one-off monetized URLs by using VigLink Anywhere.
  def viglink(link="", uid="")
    if link.present? && ENV['VIGLINK_KEY']
      parameters = "key=#{ENV['VIGLINK_KEY']}"
      parameters += "&cuid=#{CGI.escape(uid)}" if uid.present?
      parameters += "&u=#{CGI.escape(link)}"

      return "http://redirect.viglink.com?#{parameters}"
    else
      ""
    end
  end
end
