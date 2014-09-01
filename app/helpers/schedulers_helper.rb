module SchedulersHelper
  def weekday(wday)
    (
      content_tag(:div, t('date.day_names')[wday]) +
      content_tag(:span, l(Week.at(wday), format: :day_month), class: 'text-muted')
    ).html_safe
  end

  def schedule_label(schedule)
    klass = schedule.user == current_user ? 'success' : 'warning'
    content_tag(:span,
      "Reservado por #{schedule.user.name}",
      class: "label label-#{klass}").html_safe
  end
end
