module Blend2D::Geometry
  class Path
    # :nodoc:
    private def reset
      LibBlend2D.blPathReset(self).success_or_raise
    end

    # :nodoc:
    private def modify_op(op : ModifyOp, n : Int32, cmdDataOut : UInt8**, vtxDataOut : LibBlend2D::BLPoint**)
      LibBlend2D.blPathModifyOp(self, op, n, cmdDataOut, vtxDataOut).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Path)
      LibBlend2D.blPathAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Path)
      LibBlend2D.blPathAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : Path)
      LibBlend2D.blPathAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def set_vertex_at(index : Int32, cmd : UInt32, x : Float64, y : Float64)
      LibBlend2D.blPathSetVertexAt(self, index, cmd, x, y).success_or_raise
    end

    # :nodoc:
    private def remove_range(range : LibBlend2D::BLRange*)
      LibBlend2D.blPathRemoveRange(self, range).success_or_raise
    end

    # :nodoc:
    private def translate(range : LibBlend2D::BLRange*, p : LibBlend2D::BLPoint*)
      LibBlend2D.blPathTranslate(self, range, p).success_or_raise
    end

    # :nodoc:
    private def fit_to(range : LibBlend2D::BLRange*, rect : LibBlend2D::BLRect*, fitFlags : UInt32)
      LibBlend2D.blPathFitTo(self, range, rect, fitFlags).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Path, b : Path) : Int32
      LibBlend2D.blPathEquals(a, b)
    end

    # :nodoc:
    private def get_info_flags(flagsOut : UInt32*)
      LibBlend2D.blPathGetInfoFlags(self, flagsOut).success_or_raise
    end

    # :nodoc:
    private def get_control_box(boxOut : LibBlend2D::BLBox*)
      LibBlend2D.blPathGetControlBox(self, boxOut).success_or_raise
    end

    # :nodoc:
    private def get_bounding_box(boxOut : LibBlend2D::BLBox*)
      LibBlend2D.blPathGetBoundingBox(self, boxOut).success_or_raise
    end

    # :nodoc:
    private def get_figure_range(index : Int32, rangeOut : LibBlend2D::BLRange*)
      LibBlend2D.blPathGetFigureRange(self, index, rangeOut).success_or_raise
    end

    # :nodoc:
    private def get_last_vertex(vtxOut : LibBlend2D::BLPoint*)
      LibBlend2D.blPathGetLastVertex(self, vtxOut).success_or_raise
    end

    # :nodoc:
    private def get_closest_vertex(p : LibBlend2D::BLPoint*, maxDistance : Float64, indexOut : Int32*, distanceOut : Float64*)
      LibBlend2D.blPathGetClosestVertex(self, p, maxDistance, indexOut, distanceOut).success_or_raise
    end

    # :nodoc:
    private def hit_test(p : LibBlend2D::BLPoint*, fillRule : FillRule) : HitTest
      LibBlend2D.blPathHitTest(self, p, fillRule)
    end

    # :nodoc:
    private def stroke_to_sink(range : LibBlend2D::BLRange*, strokeOptions : StrokeOptions, approximationOptions : LibBlend2D::BLApproximationOptions*, a : Path, b : Path, c : Path, sink : LibBlend2D::BLPathStrokeSinkFunc, userData : Pointer)
      LibBlend2D.blPathStrokeToSink(self, range, strokeOptions, approximationOptions, a, b, c, sink, userData).success_or_raise
    end
  end
end
