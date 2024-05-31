module Blend2D
  class FontData
    # :nodoc:
    def initialize
      LibBlend2D.blFontDataInit(out @core).success_or_raise
    end

    # :nodoc:
    def finalize
      LibBlend2D.blFontDataDestroy(self).success_or_raise
    end

    # :nodoc:
    def reset : Bool
      LibBlend2D.blFontDataReset(self).success_or_raise
    end

    # :nodoc:
    def assign_move(other : FontData) : Bool
      LibBlend2D.blFontDataAssignMove(self, other).success_or_raise
    end

    # :nodoc:
    def assign_weak(other : FontData) : Bool
      LibBlend2D.blFontDataAssignWeak(self, other).success_or_raise
    end

    # :nodoc:
    def create_from_file(fileName : UInt8*, readFlags : FileReadFlags) : Bool
      LibBlend2D.blFontDataCreateFromFile(self, fileName, readFlags).success_or_raise
    end

    # :nodoc:
    def create_from_data_array(dataArray : Array) : Bool
      LibBlend2D.blFontDataCreateFromDataArray(self, dataArray).success_or_raise
    end

    # :nodoc:
    def create_from_data(data : Pointer, dataSize : Int32, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer) : Bool
      LibBlend2D.blFontDataCreateFromData(self, data, dataSize, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    def self.equals(a : FontData, b : FontData) : Int32
      LibBlend2D.blFontDataEquals(a, b)
    end

    # :nodoc:
    def face_count : UInt32
      LibBlend2D.blFontDataGetFaceCount(self)
    end

    # :nodoc:
    def face_type : FontFaceType
      LibBlend2D.blFontDataGetFaceType(self)
    end

    # :nodoc:
    def flags : FontDataFlags
      LibBlend2D.blFontDataGetFlags(self)
    end

    # :nodoc:
    def get_table_tags(faceIndex : UInt32, dst : Array) : Bool
      LibBlend2D.blFontDataGetTableTags(self, faceIndex, dst).success_or_raise
    end

    # :nodoc:
    def get_tables(faceIndex : UInt32, dst : LibBlend2D::BLFontTable*, tags : LibBlend2D::BLTag*, count : Int32) : Int32
      LibBlend2D.blFontDataGetTables(self, faceIndex, dst, tags, count)
    end
  end
end
