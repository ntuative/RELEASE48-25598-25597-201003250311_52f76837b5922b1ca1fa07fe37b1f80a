package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_262:String = "WE_CHILD_RESIZED";
      
      public static const const_1343:String = "WE_CLOSE";
      
      public static const const_1221:String = "WE_DESTROY";
      
      public static const const_143:String = "WE_CHANGE";
      
      public static const const_1385:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1482:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1244:String = "WE_MAXIMIZE";
      
      public static const const_396:String = "WE_DESTROYED";
      
      public static const const_1009:String = "WE_UNSELECT";
      
      public static const const_1377:String = "WE_MAXIMIZED";
      
      public static const const_1539:String = "WE_UNLOCKED";
      
      public static const const_368:String = "WE_CHILD_REMOVED";
      
      public static const const_161:String = "WE_OK";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1293:String = "WE_ACTIVATE";
      
      public static const const_275:String = "WE_ENABLED";
      
      public static const const_431:String = "WE_CHILD_RELOCATED";
      
      public static const const_1275:String = "WE_CREATE";
      
      public static const const_507:String = "WE_SELECT";
      
      public static const const_176:String = "";
      
      public static const const_1569:String = "WE_LOCKED";
      
      public static const const_1505:String = "WE_PARENT_RELOCATE";
      
      public static const const_1432:String = "WE_CHILD_REMOVE";
      
      public static const const_1606:String = "WE_CHILD_RELOCATE";
      
      public static const const_1473:String = "WE_LOCK";
      
      public static const const_221:String = "WE_FOCUSED";
      
      public static const const_590:String = "WE_UNSELECTED";
      
      public static const const_937:String = "WE_DEACTIVATED";
      
      public static const const_1188:String = "WE_MINIMIZED";
      
      public static const const_1577:String = "WE_ARRANGED";
      
      public static const const_1540:String = "WE_UNLOCK";
      
      public static const const_1439:String = "WE_ATTACH";
      
      public static const const_1276:String = "WE_OPEN";
      
      public static const const_1158:String = "WE_RESTORE";
      
      public static const const_1601:String = "WE_PARENT_RELOCATED";
      
      public static const const_1254:String = "WE_RELOCATE";
      
      public static const const_1472:String = "WE_CHILD_RESIZE";
      
      public static const const_1593:String = "WE_ARRANGE";
      
      public static const const_1357:String = "WE_OPENED";
      
      public static const const_1131:String = "WE_CLOSED";
      
      public static const const_1442:String = "WE_DETACHED";
      
      public static const const_1444:String = "WE_UPDATED";
      
      public static const const_1278:String = "WE_UNFOCUSED";
      
      public static const const_473:String = "WE_RELOCATED";
      
      public static const const_1143:String = "WE_DEACTIVATE";
      
      public static const const_192:String = "WE_DISABLED";
      
      public static const const_582:String = "WE_CANCEL";
      
      public static const const_559:String = "WE_ENABLE";
      
      public static const const_1252:String = "WE_ACTIVATED";
      
      public static const const_1132:String = "WE_FOCUS";
      
      public static const const_1454:String = "WE_DETACH";
      
      public static const const_1282:String = "WE_RESTORED";
      
      public static const const_1176:String = "WE_UNFOCUS";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_1249:String = "WE_PARENT_RESIZED";
      
      public static const const_1360:String = "WE_CREATED";
      
      public static const const_1501:String = "WE_ATTACHED";
      
      public static const const_1195:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1604:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1384:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1604 = param3;
         var_1384 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1384;
      }
      
      public function get related() : IWindow
      {
         return var_1604;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1384 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
