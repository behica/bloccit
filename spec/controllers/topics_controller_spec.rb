require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  
  describe "DELETE destroy" do
     it "deletes the topic" do
       delete :destroy, {id: my_topic.id}
       count = Post.where({id: my_topic.id}).size
       expect(count).to eq 0
     end
   
     it "redirects to topics index" do
       delete :destroy, {id: my_topic.id}
       expect(response).to redirect_to topics_path
     end
   end
end
