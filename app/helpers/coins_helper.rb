module CoinsHelper
  def huge_number(number)
    number_to_human(number, units: {:million => "M", :billion => "B"})
  end
  
  
  def numerical_param_field(name, options = {})
    number_field_tag name, params[name]
  end
end
