require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'routes correctly' do
    expect(get: '/').to route_to('home#index')
  end
end
