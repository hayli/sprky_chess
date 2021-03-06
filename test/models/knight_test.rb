require 'test_helper'

# Tests specific to Knight logic
class KnightTest < ActiveSupport::TestCase
  test 'legal knight moves' do
    game = FactoryGirl.create(:game)
    knight = FactoryGirl.create(
      :knight,
      x_position: 4,
      y_position: 4,
      color: false,
      game_id: game.id)

    assert knight.legal_move?(5, 6)
    assert knight.legal_move?(2, 3)
  end

  test 'illegal knight moves' do
    game = FactoryGirl.create(:game)
    knight = FactoryGirl.create(
      :knight,
      x_position: 4,
      y_position: 4,
      color: false,
      game_id: game.id)

    assert_not knight.legal_move?(5, 5), 'diagonal knight move'
    assert_not knight.legal_move?(4, 6), 'vertical knight move'
    assert_not knight.legal_move?(5, 4), 'horizontal knight move'
  end

  test 'unobstructed knight moves' do
    game = FactoryGirl.create(:game)
    knight = FactoryGirl.create(
      :knight,
      x_position: 4,
      y_position: 4,
      color: false,
      game_id: game.id)
    white_knight = FactoryGirl.create(
      :knight,
      x_position: 6,
      y_position: 3,
      color: true,
      game_id: game.id)

    assert_not knight.obstructed_move?(5, 2)
    assert_not white_knight.obstructed_move?(5, 5)
    assert_not white_knight.obstructed_move?(4, 4), 'not obstructed'
  end
end
