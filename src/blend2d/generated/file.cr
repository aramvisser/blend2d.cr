module Blend2D::Filesystem
  class BLFile
    # :nodoc:
    private def initialize
      LibBlend2D.blFileInit(out @core).success_or_raise
    end

    # :nodoc:
    private def reset
      LibBlend2D.blFileReset(self).success_or_raise
    end

    # :nodoc:
    private def open(fileName : UInt8*, openFlags : FileOpenFlags)
      LibBlend2D.blFileOpen(self, fileName, openFlags).success_or_raise
    end

    # :nodoc:
    private def close
      LibBlend2D.blFileClose(self).success_or_raise
    end

    # :nodoc:
    private def seek(offset : LibC::Long, seekType : FileSeekType, positionOut : LibC::Long*)
      LibBlend2D.blFileSeek(self, offset, seekType, positionOut).success_or_raise
    end

    # :nodoc:
    private def read(buffer : Pointer, n : Int32, bytesReadOut : Int32*)
      LibBlend2D.blFileRead(self, buffer, n, bytesReadOut).success_or_raise
    end

    # :nodoc:
    private def write(buffer : Pointer, n : Int32, bytesWrittenOut : Int32*)
      LibBlend2D.blFileWrite(self, buffer, n, bytesWrittenOut).success_or_raise
    end

    # :nodoc:
    private def truncate(maxSize : LibC::Long)
      LibBlend2D.blFileTruncate(self, maxSize).success_or_raise
    end

    # :nodoc:
    private def get_size(fileSizeOut : LibC::ULong*)
      LibBlend2D.blFileGetSize(self, fileSizeOut).success_or_raise
    end

    # :nodoc:
    private def self.system_read_file(fileName : UInt8*, dst : Array, maxSize : Int32, readFlags : FileReadFlags)
      LibBlend2D.blFileSystemReadFile(fileName, dst, maxSize, readFlags).success_or_raise
    end

    # :nodoc:
    private def self.system_write_file(fileName : UInt8*, data : Pointer, size : Int32, bytesWrittenOut : Int32*)
      LibBlend2D.blFileSystemWriteFile(fileName, data, size, bytesWrittenOut).success_or_raise
    end
  end
end
