module PagesHelper

  def nested_page_path(page)
    "lab/" + (page.ancestors + [page]).map(&:to_param).join("/")
  end

end
