require 'rails_helper'

describe ContestantOuting do
  describe 'relationships' do
    it { should belong_to(:contestant) }
    it { should belong_to(:outing) }
  end
end