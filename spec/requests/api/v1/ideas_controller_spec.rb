require "rails_helper"

describe "GET /api/v1/ideas" do
  it "returns all the current ideas with their likes" do
    chris = build(:user)
    idea1 = Idea.create(user: chris, name: "Lions tour", description: "go on the lions tour")
    idea2 = Idea.create(user: chris, name: "Go Skiing", description: "apres ski anyone?")
    Like.create(user_id: chris.id, idea: idea1, value: 1)
    Like.create(user_id: chris.id, idea: idea2, value: -1)
    
    get "/api/v1/ideas"
    expect(response.status).to eq(200)
    expect(json_response.first[:name]).to eq("Lions tour")
    expect(json_response.first[:likes_number]).to eq(1)
    expect(json_response.first[:description]).to eq("go on the lions tour")
    expect(json_response.last[:name]).to eq("Go Skiing")
    expect(json_response.last[:likes_number]).to eq(-1)
    expect(json_response.last[:description]).to eq("apres ski anyone?")
  end

end
