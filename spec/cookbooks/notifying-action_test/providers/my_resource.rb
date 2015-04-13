action :action_no_notification do
  # Test that :verbose is a valid option.
  notifying_action_wrapper(:verbose => true) do
    # This does not have any resources, so it will not trigger any notifications.
  end
end

action :action_with_notification do
  notifying_action_wrapper do
    ruby_block 'my_block' do
      block do
      end
    end
  end
end

action :action_with_filtered_out_notification do
  notifying_action_wrapper(:allow_updates_from => 'ruby_block[my_block]') do
    ruby_block 'my_block' do
      block do
      end
      only_if { false }
    end
  end
end

action :action_with_notification_matching_filter do
  notifying_action_wrapper(:allow_updates_from => 'ruby_block[my_custom_block]') do
    ruby_block 'my_custom_block' do
      block do
      end
    end
  end
end

action :action_with_notification_matching_two_filters do
  notifying_action_wrapper(
    :allow_updates_from => ['ruby_block[my_block1]', 'ruby_block[my_block2]']
  ) do
    ruby_block 'my_block1' do
      block do
      end
      only_if { false }
    end
    ruby_block 'my_block2' do
      block do
      end
    end
  end
end

action :action_no_notification_matching_one_filter_out_of_two do
  notifying_action_wrapper(
    :allow_updates_from => ['ruby_block[my_block2]']
  ) do
    ruby_block 'my_block1' do
      block do
      end
    end
    ruby_block 'my_block2' do
      block do
      end
      only_if { false }
    end
  end
end

action :action_with_notification_matching_one_filter_out_of_two do
  notifying_action_wrapper(
    :allow_updates_from => ['ruby_block[my_block1]']
  ) do
    ruby_block 'my_block1' do
      block do
      end
    end
    ruby_block 'my_block2' do
      block do
      end
      only_if { false }
    end
  end
end
