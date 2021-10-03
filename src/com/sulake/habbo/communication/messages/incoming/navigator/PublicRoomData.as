package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1973:int;
      
      private var var_1972:String;
      
      private var var_1713:int;
      
      private var _disposed:Boolean;
      
      private var var_1971:int;
      
      private var var_1974:String;
      
      private var var_1211:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1974 = param1.readString();
         var_1973 = param1.readInteger();
         var_1713 = param1.readInteger();
         var_1972 = param1.readString();
         var_1971 = param1.readInteger();
         var_1211 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1971;
      }
      
      public function get worldId() : int
      {
         return var_1713;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1974;
      }
      
      public function get unitPort() : int
      {
         return var_1973;
      }
      
      public function get castLibs() : String
      {
         return var_1972;
      }
      
      public function get nodeId() : int
      {
         return var_1211;
      }
   }
}
