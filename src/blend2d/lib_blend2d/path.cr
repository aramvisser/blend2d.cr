# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    alias BLPathSinkFunc = (BLPathCore*, Void*, Void*) -> BLResult*
    alias BLPathStrokeSinkFunc = (BLPathCore*, BLPathCore*, BLPathCore*, Int32, Int32, Void*) -> BLResult*

    fun blPathInit(self : BLPathCore*) : BLResult
    fun blPathInitMove(self : BLPathCore*, other : BLPathCore*) : BLResult
    fun blPathInitWeak(self : BLPathCore*, other : BLPathCore*) : BLResult
    fun blPathDestroy(self : BLPathCore*) : BLResult
    fun blPathReset(self : BLPathCore*) : BLResult
    fun blPathGetSize(self : BLPathCore*) : Int32
    fun blPathGetCapacity(self : BLPathCore*) : Int32
    fun blPathGetCommandData(self : BLPathCore*) : UInt8*
    fun blPathGetVertexData(self : BLPathCore*) : BLPoint*
    fun blPathClear(self : BLPathCore*) : BLResult
    fun blPathShrink(self : BLPathCore*) : BLResult
    fun blPathReserve(self : BLPathCore*, n : Int32) : BLResult
    fun blPathModifyOp(self : BLPathCore*, op : BLModifyOp, n : Int32, cmd_data_out : UInt8**, vtx_data_out : BLPoint**) : BLResult
    fun blPathAssignMove(self : BLPathCore*, other : BLPathCore*) : BLResult
    fun blPathAssignWeak(self : BLPathCore*, other : BLPathCore*) : BLResult
    fun blPathAssignDeep(self : BLPathCore*, other : BLPathCore*) : BLResult
    fun blPathSetVertexAt(self : BLPathCore*, index : Int32, cmd : UInt32, x : Float64, y : Float64) : BLResult
    fun blPathMoveTo(self : BLPathCore*, x0 : Float64, y0 : Float64) : BLResult
    fun blPathLineTo(self : BLPathCore*, x1 : Float64, y1 : Float64) : BLResult
    fun blPathPolyTo(self : BLPathCore*, poly : BLPoint*, count : Int32) : BLResult
    fun blPathQuadTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : BLResult
    fun blPathConicTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, w : Float64) : BLResult
    fun blPathCubicTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : BLResult
    fun blPathSmoothQuadTo(self : BLPathCore*, x2 : Float64, y2 : Float64) : BLResult
    fun blPathSmoothCubicTo(self : BLPathCore*, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : BLResult
    fun blPathArcTo(self : BLPathCore*, x : Float64, y : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, force_move_to : Int32) : BLResult
    fun blPathArcQuadrantTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : BLResult
    fun blPathEllipticArcTo(self : BLPathCore*, rx : Float64, ry : Float64, x_axis_rotation : Float64, large_arc_flag : Int32, sweep_flag : Int32, x1 : Float64, y1 : Float64) : BLResult
    fun blPathClose(self : BLPathCore*) : BLResult
    fun blPathAddGeometry(self : BLPathCore*, geometry_type : BLGeometryType, geometry_data : Void*, m : BLMatrix2D*, dir : BLGeometryDirection) : BLResult
    fun blPathAddBoxI(self : BLPathCore*, box : BLBoxI*, dir : BLGeometryDirection) : BLResult
    fun blPathAddBoxD(self : BLPathCore*, box : BLBox*, dir : BLGeometryDirection) : BLResult
    fun blPathAddRectI(self : BLPathCore*, rect : BLRectI*, dir : BLGeometryDirection) : BLResult
    fun blPathAddRectD(self : BLPathCore*, rect : BLRect*, dir : BLGeometryDirection) : BLResult
    fun blPathAddPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*) : BLResult
    fun blPathAddTranslatedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, p : BLPoint*) : BLResult
    fun blPathAddTransformedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, m : BLMatrix2D*) : BLResult
    fun blPathAddReversedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, reverse_mode : BLPathReverseMode) : BLResult
    fun blPathAddStrokedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, options : BLStrokeOptionsCore*, approx : BLApproximationOptions*) : BLResult
    fun blPathRemoveRange(self : BLPathCore*, range : BLRange*) : BLResult
    fun blPathTranslate(self : BLPathCore*, range : BLRange*, p : BLPoint*) : BLResult
    fun blPathTransform(self : BLPathCore*, range : BLRange*, m : BLMatrix2D*) : BLResult
    fun blPathFitTo(self : BLPathCore*, range : BLRange*, rect : BLRect*, fit_flags : UInt32) : BLResult
    fun blPathEquals(a : BLPathCore*, b : BLPathCore*) : Int32
    fun blPathGetInfoFlags(self : BLPathCore*, flags_out : UInt32*) : BLResult
    fun blPathGetControlBox(self : BLPathCore*, box_out : BLBox*) : BLResult
    fun blPathGetBoundingBox(self : BLPathCore*, box_out : BLBox*) : BLResult
    fun blPathGetFigureRange(self : BLPathCore*, index : Int32, range_out : BLRange*) : BLResult
    fun blPathGetLastVertex(self : BLPathCore*, vtx_out : BLPoint*) : BLResult
    fun blPathGetClosestVertex(self : BLPathCore*, p : BLPoint*, max_distance : Float64, index_out : Int32*, distance_out : Float64*) : BLResult
    fun blPathHitTest(self : BLPathCore*, p : BLPoint*, fill_rule : BLFillRule) : BLHitTest
    fun blStrokeOptionsInit(self : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsInitMove(self : BLStrokeOptionsCore*, other : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsInitWeak(self : BLStrokeOptionsCore*, other : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsDestroy(self : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsReset(self : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsEquals(a : BLStrokeOptionsCore*, b : BLStrokeOptionsCore*) : Int32
    fun blStrokeOptionsAssignMove(self : BLStrokeOptionsCore*, other : BLStrokeOptionsCore*) : BLResult
    fun blStrokeOptionsAssignWeak(self : BLStrokeOptionsCore*, other : BLStrokeOptionsCore*) : BLResult
    fun blPathStrokeToSink(self : BLPathCore*, range : BLRange*, stroke_options : BLStrokeOptionsCore*, approximation_options : BLApproximationOptions*, a : BLPathCore*, b : BLPathCore*, c : BLPathCore*, sink : BLPathStrokeSinkFunc, user_data : Void*) : BLResult

    enum BLPathCmd : UInt32
      Move   = 0
      On     = 1
      Quad   = 2
      Conic  = 3
      Cubic  = 4
      Close  = 5
      Weight = 6
    end

    enum BLPathCmdExtra : UInt32
      Preserve = 4294967295
    end

    enum BLPathFlags : UInt32
      NoFlags  =          0
      Empty    =          1
      Multiple =          2
      Quads    =          4
      Conics   =          8
      Cubics   =         16
      Invalid  = 1073741824
      Dirty    = 2147483648
    end

    enum BLPathReverseMode : UInt32
      Complete = 0
      Separate = 1
    end

    enum BLStrokeJoin : UInt32
      MiterClip  = 0
      MiterBevel = 1
      MiterRound = 2
      Bevel      = 3
      Round      = 4
    end

    enum BLStrokeCapPosition : UInt32
      Start = 0
      End   = 1
    end

    enum BLStrokeCap : UInt32
      Butt        = 0
      Square      = 1
      Round       = 2
      RoundRev    = 3
      Triangle    = 4
      TriangleRev = 5
    end

    enum BLStrokeTransformOrder : UInt32
      After  = 0
      Before = 1
    end

    enum BLFlattenMode : UInt32
      Default   = 0
      Recursive = 1
    end

    enum BLOffsetMode : UInt32
      Default   = 0
      Iterative = 1
    end

    struct BLApproximationOptions
      flatten_mode : UInt8
      offset_mode : UInt8
      reserved_flags : UInt8[6]
      flatten_tolerance : Float64
      simplify_tolerance : Float64
      offset_parameter : Float64
    end

    struct BLPathView
      command_data : UInt8*
      vertex_data : BLPoint*
      size : Int32
    end

    struct BLPathCore
      _d : BLPathImpl*
    end

    struct BLStrokeOptionsCore
      hints : LibC::ULong
      width : Float64
      miter_limit : Float64
      dash_offset : Float64
      dash_array : BLArrayCore
    end

    struct BLPathImpl
      command_data : UInt8*
      vertex_data : BLPoint*
      size : Int32
      capacity : Int32
      flags : UInt32
    end
  end
end
