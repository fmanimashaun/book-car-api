require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { FactoryBot.create(:city) }

  it 'Creates a city with valid attributes' do
    expect(city).to be_valid
  end

  describe 'fails to create a city with invalid attributes' do
    it 'Name attribute is not present' do
      city = FactoryBot.build(:city, name: nil)

      expect(city).to_not be_valid
    end

    it 'name attribute is too long' do
      city = FactoryBot.build(:city, name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed sem lectus.
      Ut non fermentum velit. Nunc facilisis diam id ante auctor rutrum. Proin mauris ipsum, scelerisque et convallis
      ac, molestie quis turpis. Vivamus rhoncus ex non arcu mattis, non sollicitudin est pellentesque. Curabitur neque
      risus, dignissim placerat enim eget, facilisis efficitur nisl. In dictum, diam ullamcorper hendrerit malesuada,
      augue magna cursus sapien, dignissim interdum elit ante non dui. Suspendisse tempus orci vel orci imperdiet,
      eget rutrum lacus cursus. In dictum facilisis mauris, id euismod neque tincidunt aliquet. Aenean consectetur
      lacus eget efficitur sagittis. Phasellus a sem eu leo viverra pharetra vitae in metus. Fusce suscipit scelerisque
      faucibus. Proin et ex porta, suscipit erat et, semper enim. In lobortis egestas nulla dictum aliquet. Sed eget
      consectetur nibh. Maecenas egestas et quam scelerisque consequat.")

      expect(city).to_not be_valid
    end

    it 'name attribute is too short' do
      city = FactoryBot.build(:city, name: '')

      expect(city).to_not be_valid
    end
  end

  it 'It can have many reservation records' do
    engine_type = FactoryBot.create(:engine_type)
    car = FactoryBot.create(:car)
    FactoryBot.create(:car_detail, engine_type:, car:)
    user = FactoryBot.create(:user)

    reservation1 = FactoryBot.create(:reservation, car:, city:, user:)
    reservation2 = FactoryBot.create(:reservation, car:, city:, user:)

    expect(city.reservations).to include(reservation1, reservation2)
  end
end
