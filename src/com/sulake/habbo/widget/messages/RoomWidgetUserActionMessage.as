package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_511:String = "RWUAM_RESPECT_USER";
      
      public static const const_653:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_589:String = "RWUAM_START_TRADING";
      
      public static const const_597:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_673:String = "RWUAM_WHISPER_USER";
      
      public static const const_675:String = "RWUAM_IGNORE_USER";
      
      public static const const_412:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_606:String = "RWUAM_BAN_USER";
      
      public static const const_730:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_406:String = "RWUAM_KICK_USER";
      
      public static const const_525:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_558:String = " RWUAM_RESPECT_PET";
      
      public static const const_422:String = "RWUAM_KICK_BOT";
      
      public static const const_1201:String = "RWUAM_TRAIN_PET";
      
      public static const const_619:String = "RWUAM_PICKUP_PET";
      
      public static const const_543:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_634:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
