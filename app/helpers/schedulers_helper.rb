module SchedulersHelper
  def weekday(wday)
    (
      content_tag(:div, t('date.day_names')[wday]) +
      content_tag(:span, l(Week.at(wday), format: :day_month), class: 'text-muted')
    ).html_safe
  end

  def schedule_label(schedule)
    if schedule.user == current_user
      link_to("Reservado por #{schedule.user.name}",
        "#",
        data: { id: schedule.id },
        class: "label label-success cancelable").html_safe
    else
      content_tag(:span,
        "Reservado por #{schedule.user.name}",
        class: "label label-warning").html_safe
    end
  end
end
