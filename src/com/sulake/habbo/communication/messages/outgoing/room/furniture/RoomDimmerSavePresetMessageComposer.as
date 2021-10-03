package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1623:int;
      
      private var var_1625:int;
      
      private var var_1849:Boolean;
      
      private var var_1848:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1850:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1625 = param1;
         var_1623 = param2;
         var_1848 = param3;
         var_1850 = param4;
         var_1849 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1625,var_1623,var_1848,var_1850,int(var_1849)];
      }
      
      public function dispose() : void
      {
      }
   }
}
