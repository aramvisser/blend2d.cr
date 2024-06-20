module Blend2D::Styling
  class Gradient
    # :nodoc:
    private def initialize
      LibBlend2D.blGradientInit(out @core).success_or_raise
    end

    # :nodoc:
    private def initialize(type : GradientType, values : Pointer, extendMode : ExtendMode, stops : LibBlend2D::BLGradientStop*, n : Int32, transform : LibBlend2D::BLMatrix2D*)
      LibBlend2D.blGradientInitAs(out @core, type, values, extendMode, stops, n, transform).success_or_raise
    end

    # :nodoc:
    private def reset : Bool
      LibBlend2D.blGradientReset(self).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Gradient) : Bool
      LibBlend2D.blGradientAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Gradient) : Bool
      LibBlend2D.blGradientAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def create(type : GradientType, values : Pointer, extendMode : ExtendMode, stops : LibBlend2D::BLGradientStop*, n : Int32, transform : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blGradientCreate(self, type, values, extendMode, stops, n, transform).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blGradientShrink(self).success_or_raise
    end

    # :nodoc:
    private def reserve(n : Int32) : Bool
      LibBlend2D.blGradientReserve(self, n).success_or_raise
    end

    # :nodoc:
    private def type : GradientType
      LibBlend2D.blGradientGetType(self)
    end

    # :nodoc:
    private def type=(type : GradientType)
      LibBlend2D.blGradientSetType(self, type).success_or_raise
    end

    # :nodoc:
    private def get_value(index : Int32) : Float64
      LibBlend2D.blGradientGetValue(self, index)
    end

    # :nodoc:
    private def set_value(index : Int32, value : Float64) : Bool
      LibBlend2D.blGradientSetValue(self, index, value).success_or_raise
    end

    # :nodoc:
    private def set_values(index : Int32, values : Float64*, n : Int32) : Bool
      LibBlend2D.blGradientSetValues(self, index, values, n).success_or_raise
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blGradientGetSize(self)
    end

    # :nodoc:
    private def capacity : Int32
      LibBlend2D.blGradientGetCapacity(self)
    end

    # :nodoc:
    private def stops : LibBlend2D::BLGradientStop*
      LibBlend2D.blGradientGetStops(self)
    end

    # :nodoc:
    private def reset_stops : Bool
      LibBlend2D.blGradientResetStops(self).success_or_raise
    end

    # :nodoc:
    private def assign_stops(stops : LibBlend2D::BLGradientStop*, n : Int32) : Bool
      LibBlend2D.blGradientAssignStops(self, stops, n).success_or_raise
    end

    # :nodoc:
    private def remove_stop(index : Int32) : Bool
      LibBlend2D.blGradientRemoveStop(self, index).success_or_raise
    end

    # :nodoc:
    private def remove_stop_by_offset(offset : Float64, all : UInt32) : Bool
      LibBlend2D.blGradientRemoveStopByOffset(self, offset, all).success_or_raise
    end

    # :nodoc:
    private def remove_stops_by_index(rStart : Int32, rEnd : Int32) : Bool
      LibBlend2D.blGradientRemoveStopsByIndex(self, rStart, rEnd).success_or_raise
    end

    # :nodoc:
    private def remove_stops_by_offset(offsetMin : Float64, offsetMax : Float64) : Bool
      LibBlend2D.blGradientRemoveStopsByOffset(self, offsetMin, offsetMax).success_or_raise
    end

    # :nodoc:
    private def replace_stop_rgba32(index : Int32, offset : Float64, rgba32 : UInt32) : Bool
      LibBlend2D.blGradientReplaceStopRgba32(self, index, offset, rgba32).success_or_raise
    end

    # :nodoc:
    private def replace_stop_rgba64(index : Int32, offset : Float64, rgba64 : LibC::ULong) : Bool
      LibBlend2D.blGradientReplaceStopRgba64(self, index, offset, rgba64).success_or_raise
    end

    # :nodoc:
    private def index_of_stop(offset : Float64) : Int32
      LibBlend2D.blGradientIndexOfStop(self, offset)
    end

    # :nodoc:
    private def get_transform(transformOut : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blGradientGetTransform(self, transformOut).success_or_raise
    end

    # :nodoc:
    private def transform_type : TransformType
      LibBlend2D.blGradientGetTransformType(self)
    end

    # :nodoc:
    private def apply_transform_op(opType : TransformOp, opData : Pointer) : Bool
      LibBlend2D.blGradientApplyTransformOp(self, opType, opData).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Gradient, b : Gradient) : Int32
      LibBlend2D.blGradientEquals(a, b)
    end
  end
end
