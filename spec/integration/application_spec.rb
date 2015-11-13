require 'main/import'

RSpec.describe 'Rodakase Application' do
  it 'sets env' do
    expect(Main::Application.config.container.config.env).to be(:test)
  end

  it 'loads container' do
    expect(Main::Application[:logger]).to be_instance_of(Logger)
  end

  it 'sets up namespaced dependencies' do
    expect(Main::Application['persistence.repositories.users']).to be_instance_of(Persistence::Repositories::Users)
  end

  it 'sets up auto-injection mechanism' do
    klass = Class.new { include Main::Import(:logger) }

    expect(klass.new.logger).to be_instance_of(Logger)
  end
end
