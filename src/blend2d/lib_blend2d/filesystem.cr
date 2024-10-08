# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blFileInit(self : BLFileCore*) : BLResult
    fun blFileReset(self : BLFileCore*) : BLResult
    fun blFileOpen(self : BLFileCore*, file_name : UInt8*, open_flags : BLFileOpenFlags) : BLResult
    fun blFileClose(self : BLFileCore*) : BLResult
    fun blFileSeek(self : BLFileCore*, offset : LibC::Long, seek_type : BLFileSeekType, position_out : LibC::Long*) : BLResult
    fun blFileRead(self : BLFileCore*, buffer : Void*, n : LibC::ULong, bytes_read_out : LibC::ULong*) : BLResult
    fun blFileWrite(self : BLFileCore*, buffer : Void*, n : LibC::ULong, bytes_written_out : LibC::ULong*) : BLResult
    fun blFileTruncate(self : BLFileCore*, max_size : LibC::Long) : BLResult
    fun blFileGetInfo(self : BLFileCore*, info_out : BLFileInfo*) : BLResult
    fun blFileGetSize(self : BLFileCore*, file_size_out : LibC::ULong*) : BLResult
    fun blFileSystemGetInfo(file_name : UInt8*, info_out : BLFileInfo*) : BLResult
    fun blFileSystemReadFile(file_name : UInt8*, dst : BLArrayCore*, max_size : LibC::ULong, read_flags : BLFileReadFlags) : BLResult
    fun blFileSystemWriteFile(file_name : UInt8*, data : Void*, size : LibC::ULong, bytes_written_out : LibC::ULong*) : BLResult

    enum BLFileInfoFlags : UInt32
      OwnerR          =        256
      OwnerW          =        128
      OwnerX          =         64
      OwnerMask       =        448
      GroupR          =         32
      GroupW          =         16
      GroupX          =          8
      GroupMask       =         56
      OtherR          =          4
      OtherW          =          2
      OtherX          =          1
      OtherMask       =          7
      Suid            =       2048
      Sgid            =       1024
      PermissionsMask =       4095
      Regular         =      65536
      Directory       =     131072
      Symlink         =     262144
      CharDevice      =    1048576
      BlockDevice     =    2097152
      Ifo             =    4194304
      Socket          =    8388608
      Hidden          =   16777216
      Executable      =   33554432
      Archive         =   67108864
      System          =  134217728
      Valid           = 2147483648
    end

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

    struct BLFileInfo
      size : LibC::ULong
      modified_time : LibC::Long
      flags : BLFileInfoFlags
      uid : UInt32
      gid : UInt32
      reserved : UInt32[5]
    end
  end
end
