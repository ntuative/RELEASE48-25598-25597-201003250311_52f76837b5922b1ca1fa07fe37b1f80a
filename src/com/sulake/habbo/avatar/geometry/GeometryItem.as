package com.sulake.habbo.avatar.geometry
{
   public class GeometryItem extends Node3D
   {
       
      
      private var _id:String;
      
      private var var_503:Vector3D;
      
      private var var_1251:Number;
      
      private var var_2226:Boolean = false;
      
      private var var_2225:Boolean = false;
      
      public function GeometryItem(param1:XML, param2:Boolean = false)
      {
         super(parseFloat(param1.@x),parseFloat(param1.@y),parseFloat(param1.@z));
         _id = String(param1.@id);
         var_1251 = parseFloat(param1.@radius);
         var_503 = new Vector3D(parseFloat(param1.@nx),parseFloat(param1.@ny),parseFloat(param1.@nz));
         var_2225 = parseInt(param1.@double) as Boolean;
         var_2226 = param2;
      }
      
      public function toString() : String
      {
         return _id + ": " + this.location + " - " + this.transformedLocation;
      }
      
      public function get normal() : Vector3D
      {
         return var_503;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function getDistance(param1:Vector3D) : Number
      {
         var _loc2_:Number = Math.abs(param1.z - this.transformedLocation.z - var_1251);
         var _loc3_:Number = Math.abs(param1.z - this.transformedLocation.z + var_1251);
         return Math.min(_loc2_,_loc3_);
      }
      
      public function get isDoubleSided() : Boolean
      {
         return var_2225;
      }
      
      public function get isDynamic() : Boolean
      {
         return var_2226;
      }
   }
}
