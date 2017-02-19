module ApplicationHelper

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "panel panel-danger") do
        concat(content_tag(:div, class: "panel-heading") do
          concat(content_tag(:h4, class: "panel-title") do
            concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
          end)
        end)
        concat(content_tag(:div, class: "panel-body",:style=>'color:red') do
          concat(content_tag(:ul) do
            object.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end

  def get_salon_id
    unless Salon.first.present?
         Salon.create(:name=> 'Sweet Pixie Salon',:contact_number=>'1111111111',:description=>'We are popular salon in india')
    end
    return Salon.first.id

  end

  def update_active_menu(url)

    if url == ('/' || '/appointments')
      return 'active'
    elsif url == '/appointments/new'
      return 'active'
    else

      return ''
    end

  end

end
