require 'rails_helper'
describe TransactionsController do
  let(:stripe_helper) { StripeMock.create_test_helper }  
  let(:token){ stripe_helper.generate_card_token }

  it "should post create" do
    email = Forgery(:internet).email_address
    product = Product.create(
      permalink: 'test_product',
      price:     100
    )

    post :create, permalink: product.permalink, stripeEmail: email, stripeToken: token

    expect( assigns(:sale) ).not_to be_nil
    expect( assigns(:sale).stripe_id ).not_to be_nil
    expect( product.id ).to eq(assigns(:sale).product_id)
    expect( email ).to eq(assigns(:sale).email)
  end
end