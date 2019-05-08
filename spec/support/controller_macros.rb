module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, role: 'manager')
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user, role: 'consumer')
      sign_in user
    end
  end
end
