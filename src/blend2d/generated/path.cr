module Blend2D
  class Path
    # :nodoc:
    private def reset : Bool
      LibBlend2D.blPathReset(self).success_or_raise
    end

    # :nodoc:
    private def size : Int32
      LibBlend2D.blPathGetSize(self)
    end

    # :nodoc:
    private def capacity : Int32
      LibBlend2D.blPathGetCapacity(self)
    end

    # :nodoc:
    private def command_data : UInt8*
      LibBlend2D.blPathGetCommandData(self)
    end

    # :nodoc:
    private def vertex_data : LibBlend2D::BLPoint*
      LibBlend2D.blPathGetVertexData(self)
    end

    # :nodoc:
    private def clear : Bool
      LibBlend2D.blPathClear(self).success_or_raise
    end

    # :nodoc:
    private def shrink : Bool
      LibBlend2D.blPathShrink(self).success_or_raise
    end

    # :nodoc:
    private def reserve(n : Int32) : Bool
      LibBlend2D.blPathReserve(self, n).success_or_raise
    end

    # :nodoc:
    private def modify_op(op : ModifyOp, n : Int32, cmdDataOut : UInt8**, vtxDataOut : LibBlend2D::BLPoint**) : Bool
      LibBlend2D.blPathModifyOp(self, op, n, cmdDataOut, vtxDataOut).success_or_raise
    end

    # :nodoc:
    private def assign_move(other : Path) : Bool
      LibBlend2D.blPathAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_weak(other : Path) : Bool
      LibBlend2D.blPathAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    private def assign_deep(other : Path) : Bool
      LibBlend2D.blPathAssignDeep(self, other).success_or_raise
    end

    # :nodoc:
    private def set_vertex_at(index : Int32, cmd : UInt32, x : Float64, y : Float64) : Bool
      LibBlend2D.blPathSetVertexAt(self, index, cmd, x, y).success_or_raise
    end

    # :nodoc:
    private def poly_to(poly : LibBlend2D::BLPoint*, count : Int32) : Bool
      LibBlend2D.blPathPolyTo(self, poly, count).success_or_raise
    end

    # :nodoc:
    private def add_geometry(geometryType : GeometryType, geometryData : Pointer, m : LibBlend2D::BLMatrix2D*, dir : GeometryDirection) : Bool
      LibBlend2D.blPathAddGeometry(self, geometryType, geometryData, m, dir).success_or_raise
    end

    # :nodoc:
    private def add_box_i(box : LibBlend2D::BLBoxI*, dir : GeometryDirection) : Bool
      LibBlend2D.blPathAddBoxI(self, box, dir).success_or_raise
    end

    # :nodoc:
    private def add_box_d(box : LibBlend2D::BLBox*, dir : GeometryDirection) : Bool
      LibBlend2D.blPathAddBoxD(self, box, dir).success_or_raise
    end

    # :nodoc:
    private def add_rect_i(rect : LibBlend2D::BLRectI*, dir : GeometryDirection) : Bool
      LibBlend2D.blPathAddRectI(self, rect, dir).success_or_raise
    end

    # :nodoc:
    private def add_rect_d(rect : LibBlend2D::BLRect*, dir : GeometryDirection) : Bool
      LibBlend2D.blPathAddRectD(self, rect, dir).success_or_raise
    end

    # :nodoc:
    private def add_path(other : Path, range : LibBlend2D::BLRange*) : Bool
      LibBlend2D.blPathAddPath(self, other, range).success_or_raise
    end

    # :nodoc:
    private def add_translated_path(other : Path, range : LibBlend2D::BLRange*, p : LibBlend2D::BLPoint*) : Bool
      LibBlend2D.blPathAddTranslatedPath(self, other, range, p).success_or_raise
    end

    # :nodoc:
    private def add_transformed_path(other : Path, range : LibBlend2D::BLRange*, m : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blPathAddTransformedPath(self, other, range, m).success_or_raise
    end

    # :nodoc:
    private def add_reversed_path(other : Path, range : LibBlend2D::BLRange*, reverseMode : PathReverseMode) : Bool
      LibBlend2D.blPathAddReversedPath(self, other, range, reverseMode).success_or_raise
    end

    # :nodoc:
    private def add_stroked_path(other : Path, range : LibBlend2D::BLRange*, options : StrokeOptions, approx : LibBlend2D::BLApproximationOptions*) : Bool
      LibBlend2D.blPathAddStrokedPath(self, other, range, options, approx).success_or_raise
    end

    # :nodoc:
    private def remove_range(range : LibBlend2D::BLRange*) : Bool
      LibBlend2D.blPathRemoveRange(self, range).success_or_raise
    end

    # :nodoc:
    private def translate(range : LibBlend2D::BLRange*, p : LibBlend2D::BLPoint*) : Bool
      LibBlend2D.blPathTranslate(self, range, p).success_or_raise
    end

    # :nodoc:
    private def transform(range : LibBlend2D::BLRange*, m : LibBlend2D::BLMatrix2D*) : Bool
      LibBlend2D.blPathTransform(self, range, m).success_or_raise
    end

    # :nodoc:
    private def fit_to(range : LibBlend2D::BLRange*, rect : LibBlend2D::BLRect*, fitFlags : UInt32) : Bool
      LibBlend2D.blPathFitTo(self, range, rect, fitFlags).success_or_raise
    end

    # :nodoc:
    private def self.equals(a : Path, b : Path) : Int32
      LibBlend2D.blPathEquals(a, b)
    end

    # :nodoc:
    private def get_info_flags(flagsOut : UInt32*) : Bool
      LibBlend2D.blPathGetInfoFlags(self, flagsOut).success_or_raise
    end

    # :nodoc:
    private def get_control_box(boxOut : LibBlend2D::BLBox*) : Bool
      LibBlend2D.blPathGetControlBox(self, boxOut).success_or_raise
    end

    # :nodoc:
    private def get_bounding_box(boxOut : LibBlend2D::BLBox*) : Bool
      LibBlend2D.blPathGetBoundingBox(self, boxOut).success_or_raise
    end

    # :nodoc:
    private def get_figure_range(index : Int32, rangeOut : LibBlend2D::BLRange*) : Bool
      LibBlend2D.blPathGetFigureRange(self, index, rangeOut).success_or_raise
    end

    # :nodoc:
    private def get_last_vertex(vtxOut : LibBlend2D::BLPoint*) : Bool
      LibBlend2D.blPathGetLastVertex(self, vtxOut).success_or_raise
    end

    # :nodoc:
    private def get_closest_vertex(p : LibBlend2D::BLPoint*, maxDistance : Float64, indexOut : Int32*, distanceOut : Float64*) : Bool
      LibBlend2D.blPathGetClosestVertex(self, p, maxDistance, indexOut, distanceOut).success_or_raise
    end

    # :nodoc:
    private def hit_test(p : LibBlend2D::BLPoint*, fillRule : FillRule) : HitTest
      LibBlend2D.blPathHitTest(self, p, fillRule)
    end

    # :nodoc:
    private def stroke_to_sink(range : LibBlend2D::BLRange*, strokeOptions : StrokeOptions, approximationOptions : LibBlend2D::BLApproximationOptions*, a : Path, b : Path, c : Path, sink : LibBlend2D::BLPathStrokeSinkFunc, userData : Pointer) : Bool
      LibBlend2D.blPathStrokeToSink(self, range, strokeOptions, approximationOptions, a, b, c, sink, userData).success_or_raise
    end
  end
end
