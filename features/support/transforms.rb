CAPTURE_STATUS = Transform /^(\d+)$/ do |digits|
  digits.to_i
end

CAPTURE_INT = Transform(/^(?:-?\d+|zero|one|two|three|four|five|six|seven|eight|nine|ten)$/) do |v|
  %w(zero one two three four five six seven eight nine ten).index(v) || v.to_i
end