# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    fun blRuntimeInit : BLResult
    fun blRuntimeShutdown : BLResult
    fun blRuntimeCleanup(cleanup_flags : BLRuntimeCleanupFlags) : BLResult
    fun blRuntimeQueryInfo(info_type : BLRuntimeInfoType, info_out : Void*) : BLResult
    fun blRuntimeMessageOut(msg : UInt8*) : BLResult
    fun blRuntimeMessageFmt(fmt : UInt8*) : BLResult
    fun blRuntimeMessageVFmt(fmt : UInt8*, ap : Void[1]) : BLResult
    fun blResultFromPosixError(e : Int32) : BLResult

    enum BLRuntimeLimits : UInt32
      MaxImageSize   = 65535
      MaxThreadCount =    32
    end

    enum BLRuntimeInfoType : UInt32
      Build    = 0
      System   = 1
      Resource = 2
    end

    enum BLRuntimeBuildType : UInt32
      Debug   = 0
      Release = 1
    end

    enum BLRuntimeCpuArch : UInt32
      Unknown = 0
      X86     = 1
      Arm     = 2
      Mips    = 3
    end

    enum BLRuntimeCpuFeatures : UInt32
      X86Sse2   =   1
      X86Sse3   =   2
      X86Ssse3  =   4
      X86Sse41  =   8
      X86Sse42  =  16
      X86Avx    =  32
      X86Avx2   =  64
      X86Avx512 = 128
    end

    enum BLRuntimeCleanupFlags : UInt32
      NoFlags    =          0
      ObjectPool =          1
      ZeroedPool =          2
      ThreadPool =         16
      Everything = 4294967295
    end

    struct BLRuntimeBuildInfo
      major_version : UInt32
      minor_version : UInt32
      patch_version : UInt32
      build_type : UInt32
      baseline_cpu_features : UInt32
      supported_cpu_features : UInt32
      max_image_size : UInt32
      max_thread_count : UInt32
      reserved : UInt32[2]
      compiler_info : UInt8[32]
    end

    struct BLRuntimeSystemInfo
      cpu_arch : UInt32
      cpu_features : UInt32
      core_count : UInt32
      thread_count : UInt32
      thread_stack_size : UInt32
      removed : UInt32
      allocation_granularity : UInt32
      reserved : UInt32[5]
      cpu_vendor : UInt8[16]
      cpu_brand : UInt8[64]
    end

    struct BLRuntimeResourceInfo
      vm_used : LibC::ULong
      vm_reserved : LibC::ULong
      vm_overhead : LibC::ULong
      vm_block_count : LibC::ULong
      zm_used : LibC::ULong
      zm_reserved : LibC::ULong
      zm_overhead : LibC::ULong
      zm_block_count : LibC::ULong
      dynamic_pipeline_count : LibC::ULong
      reserved : LibC::ULong[7]
    end
  end
end
