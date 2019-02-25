module ApplicationHelper
  def full_title page_title = ""
    base_title = t "E_learning"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def list_gender
    [[ I18n.t("select_gender"), ""], [ I18n.t("male"), 0], [ I18n.t("female"), 1], [ I18n.t("other_gender"), 2]]
  end
end
