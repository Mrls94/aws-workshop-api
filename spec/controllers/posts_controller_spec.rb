require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST #create' do
    let(:post_attributes) { FactoryBot.attributes_for :post }

    it 'responds with status 201' do
      post :create, params: { post_params: post_attributes }
      is_expected.to respond_with 201
    end
  end

  describe 'GET #index' do
    before do
      FactoryBot.create :post
      get :index
    end

    it 'responds with status 200' do
      is_expected.to respond_with 200
    end

    it 'contains an array of posts' do
      expect(JSON.parse(response.body)).to be_a Array
    end
  end
end
