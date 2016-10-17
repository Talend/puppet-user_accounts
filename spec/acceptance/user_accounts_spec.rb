require 'spec_helper'

describe 'user_accounts' do

  %w(dev devops ops qa).each do |g|
    describe group(g) do
      it { should exist }
    end
  end

  describe user('user1') do
      it { should_not exist }
  end

  describe user('user2') do
      it { should exist }
  end

  describe user('user3') do
      it { should exist }
  end

  describe user('user4') do
      it { should_not exist }
  end

  describe user('user5') do
      it { should exist }
  end

end
