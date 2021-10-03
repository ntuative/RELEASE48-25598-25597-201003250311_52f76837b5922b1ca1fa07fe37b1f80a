package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_115:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1715:int;
      
      private var var_419:int;
      
      private var var_745:RoomData;
      
      private var var_1769:int;
      
      private var _ownerName:String;
      
      private var var_1768:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_419 = param1.readInteger();
         var_1715 = param1.readInteger();
         var_1768 = param1.readBoolean();
         var_1769 = param1.readInteger();
         _ownerName = param1.readString();
         var_115 = new RoomData(param1);
         var_745 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1715;
      }
      
      public function get event() : RoomData
      {
         return var_745;
      }
      
      public function get room() : RoomData
      {
         return var_115;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_115 != null)
         {
            var_115.dispose();
            var_115 = null;
         }
         if(var_745 != null)
         {
            var_745.dispose();
            var_745 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_419;
      }
      
      public function get ownerId() : int
      {
         return var_1769;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1768;
      }
   }
}
