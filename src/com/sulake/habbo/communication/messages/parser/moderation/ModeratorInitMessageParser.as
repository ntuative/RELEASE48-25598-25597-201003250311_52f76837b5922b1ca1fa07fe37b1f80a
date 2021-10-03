package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1826:Boolean;
      
      private var var_1454:Array;
      
      private var var_1827:Boolean;
      
      private var var_1831:Boolean;
      
      private var var_1833:Boolean;
      
      private var var_153:Array;
      
      private var var_1830:Boolean;
      
      private var var_1829:Boolean;
      
      private var var_1455:Array;
      
      private var var_1832:Boolean;
      
      private var var_1828:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1828;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1826;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1827;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1830;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1829;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1454;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_153 = [];
         var_1454 = [];
         _roomMessageTemplates = [];
         var_1455 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_153.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1454.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1455.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1830 = param1.readBoolean();
         var_1833 = param1.readBoolean();
         var_1827 = param1.readBoolean();
         var_1831 = param1.readBoolean();
         var_1828 = param1.readBoolean();
         var_1829 = param1.readBoolean();
         var_1826 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1832 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1831;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1455;
      }
      
      public function get issues() : Array
      {
         return var_153;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1832;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1833;
      }
   }
}
