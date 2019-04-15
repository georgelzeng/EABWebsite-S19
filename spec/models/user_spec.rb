require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    for i  in 1..10 do
      FactoryGirl.create(:user, {email: "#{i}@gmail.com", sid: "#{i}", code: User.registration_code})
      FactoryGirl.create(:admin, {email: "#{i}admin@gmail.com", sid: "0#{i}", code: User.admin_code})
    end
    @regular_users = User.where(code: User.registration_code)
    @admin_users = User.where(code: User.admin_code)
  end

  #tests for change-access-code feature
  it "changes the registration code" do
    newCode = User.registration_code + "nonsense"
    User.change_registration_code(newCode)

    expect(User.registration_code).to eq(newCode)
  end

  it "changes current regular users' code to new registration code" do
    newCode = User.registration_code + "nonsense"
    User.change_registration_code(newCode)

    @regular_users.each do |user|
      expect(user.code).to be(newCode)
    end
  end

  it "keeps admin users' codes the same when changing registration code" do
    current_code = @admin_users[0].code

    newCode = User.registration_code + "nonsense"
    User.change_registration_code(newCode)

    @admin_users.each do |admin|
      expect(admin.code).to eq(current_code)
    end
  end

  it "changes the admin code" do
    newCode = User.admin_code + "nonsense"
    User.change_admin_code(newCode)

    expect(User.admin_code).to eq(newCode)
  end

  it "changes current admin users' code to new admin code" do
    newCode = User.admin_code + "nonsense"
    User.change_admin_code(newCode)

    @admin_users.each do |admin|
      expect(admin.code).to be(newCode)
    end
  end

  it "keeps regular users' codes the same when changing admin code" do
    current_code = @regular_users[0].code

    newCode = User.admin_code + "nonsense"
    User.change_admin_code(newCode)

    @regular_users.each do |user|
      expect(user.code).to eq(current_code)
    end
  end
end