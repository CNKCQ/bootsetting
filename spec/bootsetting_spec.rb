require 'Bootsetting'

describe Bootsetting::Helper do
  it "broccoli is gross" do
    expect(Bootsetting::Helper.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(Bootsetting::Helper.portray("Not Broccoli")).to eql("Delicious!")
  end
end
