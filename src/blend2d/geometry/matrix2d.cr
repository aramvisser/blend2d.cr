module Blend2D::Geometry
  struct Matrix2D < BLStruct(LibBlend2D::BLMatrix2D)
    delegate :m00, :m01, :m10, :m11, :m20, :m21, to: @core

    def self.identity : Matrix2D
      matrix = new
      LibBlend2D.blMatrix2DSetIdentity matrix
      matrix
    end

    def self.translation(x : Float64, y : Float64) : Matrix2D
      matrix = new
      LibBlend2D.blMatrix2DSetTranslation matrix, x, y
      matrix
    end

    def self.scaling(x : Float64, y : Float64) : Matrix2D
      matrix = new
      LibBlend2D.blMatrix2DSetScaling matrix, x, y
      matrix
    end

    def self.skewing(x : Float64, y : Float64) : Matrix2D
      matrix = new
      LibBlend2D.blMatrix2DSetSkewing matrix, x, y
      matrix
    end

    def self.rotation(angle : Float64) : Matrix2D
      rotation angle, 0, 0
    end

    def self.rotation(angle : Float64, cx : Float64, cy : Float64) : Matrix2D
      matrix = new
      LibBlend2D.blMatrix2DSetRotation matrix, angle, cx, cy
      matrix
    end

    protected def initialize
      @core = uninitialized LibBlend2D::BLMatrix2D
    end

    protected def initialize(@core : LibBlend2D::BLMatrix2D)
    end

    def initialize(m00 : Float64, m01 : Float64, m10 : Float64, m11 : Float64, m20 : Float64, m21 : Float64)
      @core = LibBlend2D::BLMatrix2D.new m00: m00, m01: m01, m10: m10, m11: m11, m20: m20, m21: m21
    end

    def translate(x : Float64, y : Float64) : Matrix2D
      apply_op :translate, [x, y]
    end

    def scale(x : Float64, y : Float64) : Matrix2D
      apply_op :scale, [x, y]
    end

    def skew(x : Float64, y : Float64) : Matrix2D
      apply_op :skew, [x, y]
    end

    def rotate(angle : Float64) : Matrix2D
      apply_op :rotate, [angle]
    end

    def rotate(angle : Float64, x : Float64, y : Float64) : Matrix2D
      apply_op :rotate_pt, [angle, x, y]
    end

    def transform(matrix : Matrix2D) : Matrix2D
      LibBlend2D.blMatrix2DApplyOp(self, TransformOp::Transform, matrix).success_or_raise
      self
    end

    def invert : Matrix2D
      other = Matrix2D.new
      LibBlend2D.blMatrix2DInvert(other, self).success_or_raise
      other
    end

    def type : TransformType
      LibBlend2D.blMatrix2DGetType self
    end

    private def apply_op(op : TransformOp, data : Array(Float64)) : Matrix2D
      LibBlend2D.blMatrix2DApplyOp(self, op, data).success_or_raise
      self
    end
  end
end
