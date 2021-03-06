require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      category = FactoryGirl.create(:category)
      get :show , id: category.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      category = FactoryGirl.create(:category)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      category = FactoryGirl.create(:category)
      get :show, id:Faker::Name.name, format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      category = FactoryGirl.create(:category)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      categories = Category.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      category = FactoryGirl.create(:category)
      get :edit , id:category.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      category = FactoryGirl.create(:category)
      get :edit, id:Faker::Name.name , format:'json', category:{ name:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      category = FactoryGirl.create(:category)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      post :create, format:'json', category:{ name:Faker::Book.genre }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      post :create, format:'json', category:{ name:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      category = FactoryGirl.create(:category)
      put :update, format:'json', id:category.id, category:{ name:category.name }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      category = FactoryGirl.create(:category)
      put :update, format:'json', id:category.id, category:{ name:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      category = FactoryGirl.create(:category)
      put :update, format:'json', id:'', category:{ name:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      category = FactoryGirl.create(:category)
      delete :destroy, format:'json', id:category.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      category = FactoryGirl.create(:category)
      delete :destroy, format:'json', id:Faker::Book.genre
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      category = FactoryGirl.create(:category)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end