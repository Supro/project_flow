require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  it 'routes correctly' do
    expect(get: '/entities/new').to route_to('entities#new')
    expect(post: '/entities').to route_to('entities#create')
  end
end
