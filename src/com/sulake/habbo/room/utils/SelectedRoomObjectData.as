package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_69:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_230:Vector3d = null;
      
      private var var_1869:int = 0;
      
      private var var_1867:String = null;
      
      private var _category:int = 0;
      
      private var var_1868:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1868 = param3;
         var_69 = new Vector3d();
         var_69.assign(param4);
         var_230 = new Vector3d();
         var_230.assign(param5);
         var_1869 = param6;
         var_1867 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_69;
      }
      
      public function get typeId() : int
      {
         return var_1869;
      }
      
      public function get dir() : Vector3d
      {
         return var_230;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1867;
      }
      
      public function get operation() : String
      {
         return var_1868;
      }
      
      public function dispose() : void
      {
         var_69 = null;
         var_230 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
