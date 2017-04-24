require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, {id: my_post.id}
      expect(response).to render_template :edit
    end
    
    it "assigns post to be updated to @post" do
      get :edit, {id: my_post.id}
      post_instance = assigns(:post)
      
      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end
  
  describe "PUT update" do
    it "updates the post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      
      put :update, id: my_post.id, post: {title: new_title, body: new_body}
      
      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end
    
    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      
      put :update, id: my_post.id, post: {title: new_title, body: new_body}
      expect(response).to redirect_to my_post
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, {id: my_post.id}
      count = Post.where({id: my_post.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to posts index" do
      delete :destroy, {id: my_post.id}
      expect(response).to redirect_to posts_path
    end
  end
end
