require 'will_paginate/array'
require 'rails_helper'

RSpec.describe 'new page', :type => :request do
  it "displays the article new" do
    get articles_index_path
    expect(response.status).to eq 200
  end
end

