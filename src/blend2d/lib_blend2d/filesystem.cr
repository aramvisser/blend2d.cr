# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blFileInit(self : BLFileCore*) : BLResult
    fun blFileReset(self : BLFileCore*) : BLResult
    fun blFileOpen(self : BLFileCore*, file_name : UInt8*, open_flags : BLFileOpenFlags) : BLResult
    fun blFileClose(self : BLFileCore*) : BLResult
    fun blFileSeek(self : BLFileCore*, offset : LibC::Long, seek_type : BLFileSeekType, position_out : LibC::Long*) : BLResult
    fun blFileRead(self : BLFileCore*, buffer : Void*, n : Int32, bytes_read_out : Int32*) : BLResult
    fun blFileWrite(self : BLFileCore*, buffer : Void*, n : Int32, bytes_written_out : Int32*) : BLResult
    fun blFileTruncate(self : BLFileCore*, max_size : LibC::Long) : BLResult
    fun blFileGetSize(self : BLFileCore*, file_size_out : LibC::ULong*) : BLResult
    fun blFileSystemReadFile(file_name : UInt8*, dst : BLArrayCore*, max_size : Int32, read_flags : BLFileReadFlags) : BLResult
    fun blFileSystemWriteFile(file_name : UInt8*, data : Void*, size : Int32, bytes_written_out : Int32*) : BLResult

    enum BLFileOpenFlags : UInt32
      NoFlags         =          0
      Read            =          1
      Write           =          2
      RW              =          3
      Create          =          4
      Delete          =          8
      Truncate        =         16
      ReadExclusive   =  268435456
      WriteExclusive  =  536870912
      RwExclusive     =  805306368
      CreateExclusive = 1073741824
      DeleteExclusive = 2147483648
    end

    enum BLFileSeekType : UInt32
      Set = 0
      Cur = 1
      End = 2
    end

    enum BLFileReadFlags : UInt32
      NoFlags        = 0
      MmapEnabled    = 1
      MmapAvoidSmall = 2
      MmapNoFallback = 8
    end

    struct BLFileCore
      handle : LibC::Long
    end
  end
end