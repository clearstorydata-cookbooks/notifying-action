def test_for_action(action_str)
  action_str = action_str.to_s
  notifying_action_test_my_resource action_str do
    action action_str.to_sym
    notifies :install, "package[#{action_str}]"
  end

  package action_str do
    action :nothing
  end
end

%w(
  action_no_notification
  action_with_notification
  action_with_filtered_out_notification
  action_with_notification_matching_filter
  action_with_notification_matching_two_filters
  action_no_notification_matching_one_filter_out_of_two
  action_with_notification_matching_one_filter_out_of_two
).each do |action_str|
  test_for_action(action_str)
end
