require "./spec_helper"

describe Blend2D::BLArray do
  it "can convert BLArray to crystal arrays" do
    bl_array = Blend2D::BLArray(Float64){1.0, 2.0, 3.0}
    bl_array.size.should eq 3

    array = bl_array.to_a
    array.should be_a Array(Float64)
    array.should eq [1.0, 2.0, 3.0]
  end
end
