package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2135:String;
      
      private var var_419:int;
      
      private var var_2148:String;
      
      private var var_2147:String;
      
      private var var_2146:int;
      
      private var var_2149:String;
      
      private var var_2150:int;
      
      private var var_625:Array;
      
      private var var_1046:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_625 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1046 = false;
            return;
         }
         this.var_1046 = true;
         var_2146 = int(_loc2_);
         var_2148 = param1.readString();
         var_419 = int(param1.readString());
         var_2150 = param1.readInteger();
         var_2135 = param1.readString();
         var_2147 = param1.readString();
         var_2149 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_625.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2150;
      }
      
      public function get eventName() : String
      {
         return var_2135;
      }
      
      public function get eventDescription() : String
      {
         return var_2147;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2148;
      }
      
      public function get tags() : Array
      {
         return var_625;
      }
      
      public function get creationTime() : String
      {
         return var_2149;
      }
      
      public function get exists() : Boolean
      {
         return var_1046;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2146;
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
         this.var_625 = null;
      }
      
      public function get flatId() : int
      {
         return var_419;
      }
   }
}
