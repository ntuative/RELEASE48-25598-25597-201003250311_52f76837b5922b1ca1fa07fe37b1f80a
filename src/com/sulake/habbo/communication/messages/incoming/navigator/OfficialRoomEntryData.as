package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1339:int = 4;
      
      public static const const_674:int = 3;
      
      public static const const_701:int = 2;
      
      public static const const_914:int = 1;
       
      
      private var var_2110:String;
      
      private var _disposed:Boolean;
      
      private var var_1715:int;
      
      private var var_2109:Boolean;
      
      private var var_849:String;
      
      private var var_889:PublicRoomData;
      
      private var var_2111:int;
      
      private var _index:int;
      
      private var var_2112:String;
      
      private var _type:int;
      
      private var var_1781:String;
      
      private var var_890:GuestRoomData;
      
      private var var_2113:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2110 = param1.readString();
         var_2113 = param1.readString();
         var_2109 = param1.readInteger() == 1;
         var_2112 = param1.readString();
         var_849 = param1.readString();
         var_2111 = param1.readInteger();
         var_1715 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_914)
         {
            var_1781 = param1.readString();
         }
         else if(_type == const_674)
         {
            var_889 = new PublicRoomData(param1);
         }
         else if(_type == const_701)
         {
            var_890 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2111;
      }
      
      public function get popupCaption() : String
      {
         return var_2110;
      }
      
      public function get userCount() : int
      {
         return var_1715;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2109;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_914)
         {
            return 0;
         }
         if(this.type == const_701)
         {
            return this.var_890.maxUserCount;
         }
         if(this.type == const_674)
         {
            return this.var_889.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2113;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_890 != null)
         {
            this.var_890.dispose();
            this.var_890 = null;
         }
         if(this.var_889 != null)
         {
            this.var_889.dispose();
            this.var_889 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_890;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2112;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_889;
      }
      
      public function get picRef() : String
      {
         return var_849;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1781;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
