require "./spec_helper"

describe Blend2D::ImageCodec do
  describe ".built_in_codecs" do
    it "returns an array of image codecs" do
      codecs = Blend2D::ImageCodec.built_in_codecs
      codecs.should be_a Array(Blend2D::ImageCodec)
      codecs.map(&.name.to_s).sort.should eq ["BMP", "JPEG", "PNG"]
    end
  end
end
