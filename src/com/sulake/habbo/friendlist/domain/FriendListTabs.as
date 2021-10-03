package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_1790:int = 200;
      
      private var var_665:int = 200;
      
      private var var_426:IFriendListTabsDeps;
      
      private var var_443:Array;
      
      private var var_1438:FriendListTab;
      
      private var var_1437:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_443 = new Array();
         super();
         var_426 = param1;
         var_443.push(new FriendListTab(var_426.getFriendList(),FriendListTab.const_84,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_443.push(new FriendListTab(var_426.getFriendList(),FriendListTab.const_87,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_443.push(new FriendListTab(var_426.getFriendList(),FriendListTab.const_293,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         method_3(null);
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_443)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get tabContentWidth() : int
      {
         return var_1437 - 2;
      }
      
      public function method_3(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_665 = var_1790;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_1790 = var_665;
            var_665 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_443)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_665 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_443)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_1438 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1438 != null)
         {
            return var_1438;
         }
         return var_443[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_665;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1437 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_443;
      }
      
      public function get windowWidth() : int
      {
         return var_1437;
      }
   }
}
