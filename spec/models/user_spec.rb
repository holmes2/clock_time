require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(first_name: 'test', last_name: 'last', user_name: 'user') }
  context 'on creating shift' do
    it 'should create shift' do
      expect(user.start_shift).to be(true)
    end
  end

  context 'when creating break' do
    context 'when shift did not start' do
      it 'should return nil' do
        expect(user.start_break).to be(nil)
      end
    end

    context 'when shift has already started' do
      before do
        user.start_shift
      end
      it 'should return true' do
        expect(user.start_break).to be(true)
      end
    end
  end

  context 'when creating lunch break' do
    context 'when shift has already started' do
      before do
        user.start_shift
      end
      it 'should return true' do
        expect(user.start_lunch_break).to be(true)
      end
    end
    context 'when shift has not started' do
      it 'should return nil' do
        expect(user.start_lunch_break).to be(nil)
      end
    end
  end
end
