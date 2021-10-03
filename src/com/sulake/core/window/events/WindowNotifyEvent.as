package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1342:String = "WN_CREATED";
      
      public static const const_926:String = "WN_DISABLE";
      
      public static const const_797:String = "WN_DEACTIVATED";
      
      public static const const_977:String = "WN_OPENED";
      
      public static const const_828:String = "WN_CLOSED";
      
      public static const const_847:String = "WN_DESTROY";
      
      public static const const_1582:String = "WN_ARRANGED";
      
      public static const const_397:String = "WN_PARENT_RESIZED";
      
      public static const const_1002:String = "WN_ENABLE";
      
      public static const const_827:String = "WN_RELOCATE";
      
      public static const const_1013:String = "WN_FOCUS";
      
      public static const const_998:String = "WN_PARENT_RELOCATED";
      
      public static const const_359:String = "WN_PARAM_UPDATED";
      
      public static const const_509:String = "WN_PARENT_ACTIVATED";
      
      public static const const_170:String = "WN_RESIZED";
      
      public static const const_900:String = "WN_CLOSE";
      
      public static const const_887:String = "WN_PARENT_REMOVED";
      
      public static const const_241:String = "WN_CHILD_RELOCATED";
      
      public static const const_532:String = "WN_ENABLED";
      
      public static const const_254:String = "WN_CHILD_RESIZED";
      
      public static const const_961:String = "WN_MINIMIZED";
      
      public static const const_728:String = "WN_DISABLED";
      
      public static const const_209:String = "WN_CHILD_ACTIVATED";
      
      public static const const_409:String = "WN_STATE_UPDATED";
      
      public static const const_553:String = "WN_UNSELECTED";
      
      public static const const_355:String = "WN_STYLE_UPDATED";
      
      public static const const_1529:String = "WN_UPDATE";
      
      public static const const_391:String = "WN_PARENT_ADDED";
      
      public static const const_685:String = "WN_RESIZE";
      
      public static const const_699:String = "WN_CHILD_REMOVED";
      
      public static const const_1566:String = "";
      
      public static const const_826:String = "WN_RESTORED";
      
      public static const const_282:String = "WN_SELECTED";
      
      public static const const_829:String = "WN_MINIMIZE";
      
      public static const const_869:String = "WN_FOCUSED";
      
      public static const const_1207:String = "WN_LOCK";
      
      public static const const_302:String = "WN_CHILD_ADDED";
      
      public static const const_905:String = "WN_UNFOCUSED";
      
      public static const const_423:String = "WN_RELOCATED";
      
      public static const const_877:String = "WN_DEACTIVATE";
      
      public static const const_1160:String = "WN_CRETAE";
      
      public static const const_855:String = "WN_RESTORE";
      
      public static const const_304:String = "WN_ACTVATED";
      
      public static const const_1162:String = "WN_LOCKED";
      
      public static const const_388:String = "WN_SELECT";
      
      public static const const_811:String = "WN_MAXIMIZE";
      
      public static const const_991:String = "WN_OPEN";
      
      public static const const_726:String = "WN_UNSELECT";
      
      public static const const_1547:String = "WN_ARRANGE";
      
      public static const const_1185:String = "WN_UNLOCKED";
      
      public static const const_1498:String = "WN_UPDATED";
      
      public static const const_816:String = "WN_ACTIVATE";
      
      public static const const_1243:String = "WN_UNLOCK";
      
      public static const const_928:String = "WN_MAXIMIZED";
      
      public static const const_1006:String = "WN_DESTROYED";
      
      public static const const_1005:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1604,cancelable);
      }
   }
}
