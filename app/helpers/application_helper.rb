module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
    end
  end
end
