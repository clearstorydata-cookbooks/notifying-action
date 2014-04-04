require_relative '../spec_helper.rb'

describe 'notifying-action_test' do

  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ['notifying_action_test_my_resource', 'ruby_block']) do |node|
    end
  end

  it 'blah' do
    chef_run.converge(described_recipe)
    expect(chef_run).not_to install_package('action_no_notification')
    expect(chef_run).to install_package('action_with_notification')
    expect(chef_run).not_to install_package('action_with_filtered_out_notification')
    expect(chef_run).to install_package('action_with_notification_matching_filter')
    expect(chef_run).to install_package('action_with_notification_matching_two_filters')
    expect(chef_run).not_to install_package('action_no_notification_matching_one_filter_out_of_two')
    expect(chef_run).to install_package('action_with_notification_matching_one_filter_out_of_two')
  end
end
