class BootstrapHTMLList < Ariane::Render::HTMLList
  def list(crumbs)
    content_tag(:ol, class: options[:list_class]) do
      raw items(crumbs)
    end
  end

  def divider
    # content_tag(:span, '|', class: 'separator')
  end
end

Ariane.configure do |config|
  config.default_renderer = BootstrapHTMLList
end