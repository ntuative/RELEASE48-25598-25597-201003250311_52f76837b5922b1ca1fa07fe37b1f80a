package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.friendlist.HabboFriendList;
   import com.sulake.habbo.friendlist.ITabView;
   
   public class FriendListTab
   {
      
      public static const const_87:int = 2;
      
      public static const const_293:int = 3;
      
      public static const const_84:int = 1;
       
      
      private var _id:int;
      
      private var _view:IWindowContainer;
      
      private var var_1425:ITabView;
      
      private var _footerName:String;
      
      private var var_803:Boolean;
      
      private var var_1752:String;
      
      private var _name:String;
      
      private var _selected:Boolean;
      
      public function FriendListTab(param1:HabboFriendList, param2:int, param3:ITabView, param4:String, param5:String, param6:String)
      {
         super();
         _id = param2;
         _name = param4;
         var_1425 = param3;
         _footerName = param5;
         var_1752 = param6;
         var_1425.init(param1);
      }
      
      public function get footerName() : String
      {
         return _footerName;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         _view = param1;
      }
      
      public function get tabView() : ITabView
      {
         return var_1425;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            var_803 = false;
         }
         _selected = param1;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(selected)
         {
            var_803 = false;
         }
         else
         {
            var_803 = param1;
         }
      }
      
      public function get newMessageArrived() : Boolean
      {
         return var_803;
      }
      
      public function get headerPicName() : String
      {
         return var_1752;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
   }
}
