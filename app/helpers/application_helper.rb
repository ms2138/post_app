module ApplicationHelper
  include Pagy::Frontend

  def full_title(page_title  = "")
    page_title
  end
end
