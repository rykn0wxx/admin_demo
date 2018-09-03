module LayoutHelper
  def title(page_title, show_navigation = true)
    content_for(:title) { page_title.to_s }
    @show_navigation = show_navigation
  end
  def show_navigation?
    @show_navigation
  end
  def admin_file_import
    content_tag(:div, :class => 'form-group') do
      content_tag(:p, 'File input') +
      content_tag(:div, :class => 'input-group') do
        content_tag(:label, :class => 'input-group-btn') do
          content_tag(:span, :class => 'button button-primary') do
            content_tag(:span, 'Browse...') +
            file_field_tag(:file, :accept => '.csv', :multiple => false, :class => 'hide')
          end
        end +
        '<input type="text" class="form-control form-control-text" disabled>'.html_safe
      end
    end
  end
  def telephony_week
    bar_chart telephony_week_charts_path, height: '500px'
  end
end
