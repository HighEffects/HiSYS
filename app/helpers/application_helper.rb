module ApplicationHelper

  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    require 'pygmentize'
    doc = Nokogiri::HTML(html)
    
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Pygmentize.process(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

end

require "application_helper"
