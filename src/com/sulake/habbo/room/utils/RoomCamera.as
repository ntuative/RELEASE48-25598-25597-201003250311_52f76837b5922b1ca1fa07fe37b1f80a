package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_344:Number = 0.5;
      
      private static const const_763:int = 3;
      
      private static const const_1067:Number = 1;
       
      
      private var var_1885:Boolean = false;
      
      private var var_1891:Boolean = false;
      
      private var var_1000:int = 0;
      
      private var var_253:Vector3d = null;
      
      private var var_1893:int = 0;
      
      private var var_1889:int = 0;
      
      private var var_1888:Boolean = false;
      
      private var var_1890:int = -2;
      
      private var var_1892:Boolean = false;
      
      private var var_1886:int = 0;
      
      private var var_1887:int = -1;
      
      private var var_406:Vector3d = null;
      
      private var var_1894:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1893;
      }
      
      public function get targetId() : int
      {
         return var_1887;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1886 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1893 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1885 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1887 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1891 = param1;
      }
      
      public function dispose() : void
      {
         var_406 = null;
         var_253 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_406 == null)
         {
            var_406 = new Vector3d();
         }
         var_406.assign(param1);
         var_1000 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1890;
      }
      
      public function get screenHt() : int
      {
         return var_1894;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1889 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_253;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1894 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1886;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1885;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1891;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_406 != null && var_253 != null)
         {
            ++var_1000;
            _loc2_ = Vector3d.dif(var_406,var_253);
            if(_loc2_.length <= const_344)
            {
               var_253 = var_406;
               var_406 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_344 * (const_763 + 1))
               {
                  _loc2_.mul(const_344);
               }
               else if(var_1000 <= const_763)
               {
                  _loc2_.mul(const_344);
               }
               else
               {
                  _loc2_.mul(const_1067);
               }
               var_253 = Vector3d.sum(var_253,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1888 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1889;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1892 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1890 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_253 != null)
         {
            return;
         }
         var_253 = new Vector3d();
         var_253.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1888;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1892;
      }
   }
}
