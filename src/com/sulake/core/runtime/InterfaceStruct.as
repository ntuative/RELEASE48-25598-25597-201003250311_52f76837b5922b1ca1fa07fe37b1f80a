package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_397:uint;
      
      private var var_975:IUnknown;
      
      private var var_1190:String;
      
      private var var_974:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_974 = param1;
         var_1190 = getQualifiedClassName(var_974);
         var_975 = param2;
         var_397 = 0;
      }
      
      public function get iid() : IID
      {
         return var_974;
      }
      
      public function get disposed() : Boolean
      {
         return var_975 == null;
      }
      
      public function get references() : uint
      {
         return var_397;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_397) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_975;
      }
      
      public function get iis() : String
      {
         return var_1190;
      }
      
      public function reserve() : uint
      {
         return ++var_397;
      }
      
      public function dispose() : void
      {
         var_974 = null;
         var_1190 = null;
         var_975 = null;
         var_397 = 0;
      }
   }
}
