# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  api_key         :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.not_to allow_value("test@test").for(:email) }
    it { is_expected.to have_secure_password }
  end

  describe 'instance methods' do
    it '#update_api_key' do
      new_params = {
        email: 'test@yopmail.com',
        password: 'password',
        password_confirmation: 'password'
      }

      user = described_class.create!(new_params)

      expect(user.api_key).not_to be(nil)
    end
  end
end
