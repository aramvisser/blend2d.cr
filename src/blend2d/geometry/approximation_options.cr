module Blend2D::Geometry
  struct ApproximationOptions < BLStruct(LibBlend2D::BLApproximationOptions)
    delegate :flatten_mode,
      :offset_mode,
      :reserved_flags,
      :flatten_tolerance,
      :simplify_tolerance,
      :offset_parameter,
      to: @core

    def initialize(@core : T)
    end
  end
end
