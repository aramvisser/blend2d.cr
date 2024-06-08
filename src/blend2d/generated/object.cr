module Blend2D
  class Object
    # :nodoc:
    private def alloc_impl(objectInfo : UInt32, implSize : Int32) : Bool
      LibBlend2D.blObjectAllocImpl(self, objectInfo, implSize).success_or_raise
    end

    # :nodoc:
    private def alloc_impl_aligned(objectInfo : UInt32, implSize : Int32, implAlignment : Int32) : Bool
      LibBlend2D.blObjectAllocImplAligned(self, objectInfo, implSize, implAlignment).success_or_raise
    end

    # :nodoc:
    private def alloc_impl_external(objectInfo : UInt32, implSize : Int32, immutable : Int32, destroyFunc : LibBlend2D::BLDestroyExternalDataFunc, userData : Pointer) : Bool
      LibBlend2D.blObjectAllocImplExternal(self, objectInfo, implSize, immutable, destroyFunc, userData).success_or_raise
    end

    # :nodoc:
    private def self.free_impl(impl : LibBlend2D::BLObjectImpl*) : Bool
      LibBlend2D.blObjectFreeImpl(impl).success_or_raise
    end

    # :nodoc:
    private def self.reset(self_ : Pointer) : Bool
      LibBlend2D.blObjectReset(self_).success_or_raise
    end

    # :nodoc:
    private def self.assign_move(self_ : Pointer, other : Pointer) : Bool
      LibBlend2D.blObjectAssignMove(self_, other).success_or_raise
    end

    # :nodoc:
    private def self.assign_weak(self_ : Pointer, other : Pointer) : Bool
      LibBlend2D.blObjectAssignWeak(self_, other).success_or_raise
    end

    # :nodoc:
    private def self.get_property(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : Var) : Bool
      LibBlend2D.blObjectGetProperty(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_bool(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : Int32*) : Bool
      LibBlend2D.blObjectGetPropertyBool(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_int32(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : Int32*) : Bool
      LibBlend2D.blObjectGetPropertyInt32(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_int64(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : LibC::Long*) : Bool
      LibBlend2D.blObjectGetPropertyInt64(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_u_int32(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : UInt32*) : Bool
      LibBlend2D.blObjectGetPropertyUInt32(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_u_int64(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : LibC::ULong*) : Bool
      LibBlend2D.blObjectGetPropertyUInt64(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.get_property_double(self_ : Pointer, name : UInt8*, nameSize : Int32, valueOut : Float64*) : Bool
      LibBlend2D.blObjectGetPropertyDouble(self_, name, nameSize, valueOut).success_or_raise
    end

    # :nodoc:
    private def self.set_property(self_ : Pointer, name : UInt8*, nameSize : Int32, value : Pointer) : Bool
      LibBlend2D.blObjectSetProperty(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_bool(self_ : Pointer, name : UInt8*, nameSize : Int32, value : Int32) : Bool
      LibBlend2D.blObjectSetPropertyBool(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_int32(self_ : Pointer, name : UInt8*, nameSize : Int32, value : Int32) : Bool
      LibBlend2D.blObjectSetPropertyInt32(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_int64(self_ : Pointer, name : UInt8*, nameSize : Int32, value : LibC::Long) : Bool
      LibBlend2D.blObjectSetPropertyInt64(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_u_int32(self_ : Pointer, name : UInt8*, nameSize : Int32, value : UInt32) : Bool
      LibBlend2D.blObjectSetPropertyUInt32(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_u_int64(self_ : Pointer, name : UInt8*, nameSize : Int32, value : LibC::ULong) : Bool
      LibBlend2D.blObjectSetPropertyUInt64(self_, name, nameSize, value).success_or_raise
    end

    # :nodoc:
    private def self.set_property_double(self_ : Pointer, name : UInt8*, nameSize : Int32, value : Float64) : Bool
      LibBlend2D.blObjectSetPropertyDouble(self_, name, nameSize, value).success_or_raise
    end
  end
end
