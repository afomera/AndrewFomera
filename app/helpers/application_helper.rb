module ApplicationHelper
  def page_title(page_title)
    content_for(:title) { page_title }
  end

  def meta_description(meta_description)
    content_for(:meta_description) { meta_description }
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end

    def block_html(raw_html)
      if raw_html =~ /^<iframe.*>$/ # You may want to optimize this.
        raw_html
      end
    end
  end

  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
