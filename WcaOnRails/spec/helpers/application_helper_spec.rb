require "rails_helper"

describe ApplicationHelper do
  describe "#alert" do
    it "escapes note" do
      string = helper.alert(:warning, "good job", note: true)
      expect(string).to eq '<div class="alert alert-warning"><strong>Note:</strong> good job</div>'
    end
  end

  describe "#users_to_sentence" do
    it "escapes name" do
      users = []
      users << FactoryGirl.create(:user, name: "Jonatan")
      users << FactoryGirl.create(:user, name: "Pedro")
      users << FactoryGirl.create(:user, name: "Jeremy O'Fleischman")
      string = helper.users_to_sentence(users)
      expect(string).to eq 'Jeremy O&#39;Fleischman, Jonatan, and Pedro'
    end

    it "includes email" do
      users = []
      users << FactoryGirl.create(:user, name: "Jonatan O'Klosko", email: "jonatan@worldcubeassociation.org")
      users << FactoryGirl.create(:user, name: "Jeremy", email: "jfly@worldcubeassociation.org")
      string = helper.users_to_sentence(users, include_email: true)
      expect(string).to eq '<a href="mailto:jfly@worldcubeassociation.org">Jeremy</a> and <a href="mailto:jonatan@worldcubeassociation.org">Jonatan O&#39;Klosko</a>'
    end
  end
end
